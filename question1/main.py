import boto3
import argparse
import sys

from pprint import pprint

def parse_arguments():
    """
    Parse command line arguments.
    """
    parser = argparse.ArgumentParser(description='Pass the AWS region to query.')
    parser.add_argument('--region', default='us-east-1', help='The AWS region to query. Default is us-east-1.')
    return parser.parse_args()

def get_instances_by_ami(ec2, result):
    """
    Query the EC2 client for all instances and group them by AMI into the result dictionary.
    """
    instance_paginator = ec2.get_paginator('describe_instances')
    instance_response = instance_paginator.paginate().build_full_result()

    for item in instance_response['Reservations']:
        for instance in item['Instances']:
            instance_id = instance['InstanceId']
            image_id = instance['ImageId']

            if image_id in result:
                result[image_id]['InstanceIds'].append(instance_id)
            else:
                result[image_id] = {}
                result[image_id]['InstanceIds'] = [instance_id]

def get_ami_info(ec2, result):
    """
    Gather additional information about the AMIs in the result dictionary.
    """
    ami_paginator = ec2.get_paginator('describe_images')
    ami_response = ami_paginator.paginate(ImageIds=list(result.keys())).build_full_result()

    for image in ami_response['Images']:
        image_id = image['ImageId']
        result[image_id]['ImageDescription'] = image.get('Description')
        result[image_id]['ImageName'] = image.get('Name')
        result[image_id]['ImageLocation'] = image.get('ImageLocation')
        result[image_id]['OwnerID'] = image.get('OwnerId')

def main():
    try:
        args = parse_arguments()
        region = args.region
    except Exception as e:
        print(f'Error: {e}')
        sys.exit(1)

    ec2 = boto3.client('ec2', region_name=region)
    result = {}

    get_instances_by_ami(ec2, result)
    get_ami_info(ec2, result)

    pprint(result)

if __name__ == '__main__':
    main()
