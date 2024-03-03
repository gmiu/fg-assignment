module "ecs_cluster" {
  source  = "terraform-aws-modules/ecs/aws//modules/cluster"
  version = "5.9.1"

  cluster_name = var.cluster_name

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
        base   = 20
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }
}

module "ecs_service" {
  source  = "terraform-aws-modules/ecs/aws//modules/service"
  version = "5.9.1"

  name        = var.service_name
  cluster_arn = module.ecs_cluster.arn

  container_definitions = {
    test_app = {
      image = "gm93/test_app:0.0.3"
      environment = [
        {
          name  = "DB_HOST"
          value = var.db_host
        },
        {
          name  = "DB_NAME"
          value = var.db_name
        },
        {
          name  = "DB_USER"
          value = var.db_user
        },
        {
          name  = "DB_PASS"
          value = var.db_pass
        }
      ]
      port_mappings = [{
        containerPort = 8080
        hostPort      = 8080
        protocol      = "tcp"
        name          = "test_app"
      }]
      readonly_root_filesystem  = false
      enable_cloudwatch_logging = true
    }
  }

  subnet_ids = var.subnet_ids

  load_balancer = {
    service = {
      target_group_arn = var.http_target_group_arn
      container_name   = "test_app"
      container_port   = 8080
    }
  }

  security_group_rules = {
    alb_ingress = {
      type                     = "ingress"
      from_port                = 8080
      to_port                  = 8080
      protocol                 = "tcp"
      description              = "Service port"
      source_security_group_id = var.alb_security_group_id
    }
    egress_all = {
      type        = "egress"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
