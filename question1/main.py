import boto3
from pprint import pprint

REGION = 'us-east-1'

ec2 = boto3.client('ec2', region_name=REGION)
paginator = ec2.get_paginator('describe_instances')
response = paginator.paginate().build_full_result()

result = {}

for item in response['Reservations']:
    for instance in item['Instances']:
        instance_id = instance['InstanceId']
        image_id = instance['ImageId']

        if image_id in result:
            result[image_id]['InstanceIds'].append(instance_id)
        else:
            result[image_id] = {}
            result[image_id]['InstanceIds'] = [instance_id]


paginator_images = ec2.get_paginator('describe_images')
response_images = paginator_images.paginate(ImageIds=list(result.keys())).build_full_result()

for image in response_images['Images']:
    image_id = image['ImageId']
    result[image_id]['ImageDescription'] = image.get('Description')
    result[image_id]['ImageName'] = image.get('Name')
    result[image_id]['ImageLocation'] = image.get('ImageLocation')
    result[image_id]['OwnerID'] = image.get('OwnerId')

pprint(result)
