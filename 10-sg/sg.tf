module "mysql_sg"{
    source ="git::https://github.com/YamunaRavooru/sg-module.git?ref=main"
    project= var.project_name
    environment=var.environment
    sg_name ="mysql"
    common_tags=var.common_tags
    sg_description= "security group for expense project mysql instance"
    vpc_id = data.aws_ssm_parameter.vpc_id.value

}

module "bastion_sg"{
    source ="git::https://github.com/YamunaRavooru/sg-module.git?ref=main"
    project= var.project_name
    environment=var.environment
    sg_name ="bastion"
    common_tags=var.common_tags
    sg_description= "security group for expense project bastion instance"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}
module "alb_ingress_sg"{
    source ="git::https://github.com/YamunaRavooru/sg-module.git?ref=main"
    project= var.project_name
    environment=var.environment
    sg_name ="ingress_contoller"
    common_tags=var.common_tags
    sg_description= "security group for expense project ingress contoller"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}
module "eks_control_plane_sg"{
    source ="git::https://github.com/YamunaRavooru/sg-module.git?ref=main"
    project= var.project_name
    environment=var.environment
    sg_name ="eks_control_plan"
    common_tags=var.common_tags
    sg_description= "security group for expense project eks contoller plane"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}
module "eks_node_sg"{
    source ="git::https://github.com/YamunaRavooru/sg-module.git?ref=main"
    project= var.project_name
    environment=var.environment
    sg_name ="node_eks"
    common_tags=var.common_tags
    sg_description= "security group for expense project node eks"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
}

# # ports 22,  443,  1194, 943 ---> vpn ports
# module "sg_vpn"{
#     source ="git::https://github.com/YamunaRavooru/sg-module.git?ref=main"
#     project= var.project_name
#     environment=var.environment
#     sg_name ="vpn"
#     common_tags=var.common_tags
#     sg_description= "security group for expense project vpn"
#     vpc_id = data.aws_ssm_parameter.vpc_id.value
# }
# resource "aws_security_group_rule" "eks_control_plane_node" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#  source_security_group_id  = module.sg_node_eks.sg_id
#   security_group_id = module.sg_eks_control_plane.sg_id
# }
# resource "aws_security_group_rule" "node_eks_control_plane" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#  source_security_group_id  = module.sg_eks_control_plane.sg_id
#   security_group_id = module.sg_node_eks.sg_id
# }
# resource "aws_security_group_rule" "node_ingress_alb" {
#   type              = "ingress"
#   from_port         = 30000
#   to_port           = 32767
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_ingress_alb.sg_id
#   security_group_id = module.sg_node_eks.sg_id
# }
# resource "aws_security_group_rule" "node_vpc" {
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "tcp"
#  cidr_blocks        =["10.0.0.0/16"] #this is internal traffic
#   security_group_id = module.sg_node_eks.sg_id
# }
# resource "aws_security_group_rule" "node_bastion" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_bastion.sg_id
#   security_group_id = module.sg_node_eks.sg_id
# }

# #app alb accepting traffic from bation
# resource "aws_security_group_rule" "ingress_alb_bastion" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_bastion.sg_id
#   security_group_id = module.sg_ingress_alb.sg_id
# }
# resource "aws_security_group_rule" "ingress_alb_bastion_https" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_bastion.sg_id
#   security_group_id = module.sg_ingress_alb.sg_id
# }
# resource "aws_security_group_rule" "ingress_alb_public_https" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       =["0.0.0.0/0"]
#   security_group_id = module.sg_ingress_alb.sg_id
# }
# # JDOPS-32, Bastion host should be accessed from office n/w
# resource "aws_security_group_rule" "bastion_public" {
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#  protocol          = "tcp"
#  cidr_blocks    = ["0.0.0.0/0"]
# security_group_id = module.sg_bastion.sg_id
# }

# #mysql host should be acessed  trafic from bastion
# resource "aws_security_group_rule" "mysql_bastion" {
#   type              = "ingress"
#   from_port         = 3306
#   to_port           = 3306
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_bastion.sg_id
#   security_group_id = module.sg_mysql.sg_id
# }
# resource "aws_security_group_rule" "mysql_node_eks" {
#   type              = "ingress"
#   from_port         = 3306
#   to_port           = 3306
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_node_eks.sg_id
#   security_group_id = module.sg_mysql.sg_id
# }
# resource "aws_security_group_rule" "eks_control_plane_bastion" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#  source_security_group_id  = module.sg_bastion.sg_id
#   security_group_id = module.sg_eks_control_plane.sg_id
# }

resource "aws_security_group_rule" "eks_control_plane_node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id       = module.eks_node_sg.sg_id
  security_group_id = module.eks_control_plane_sg.sg_id
}
resource "aws_security_group_rule" "eks_node_eks_control_plane" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id       = module.eks_control_plane_sg.sg_id
  security_group_id = module.eks_node_sg.sg_id
}
resource "aws_security_group_rule" "node_alb_ingress" {
  type              = "ingress"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  source_security_group_id       = module.alb_ingress_sg.sg_id
  security_group_id = module.eks_node_sg.sg_id
}
resource "aws_security_group_rule" "node_vpc" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks = ["10.0.0.0/16"] # our private IP address range
  security_group_id = module.eks_node_sg.sg_id
}
resource "aws_security_group_rule" "node_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id = module.eks_node_sg.sg_id
}
# APP ALB accepting traffic from bastion
resource "aws_security_group_rule" "alb_ingress_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id       = module.bastion_sg.sg_id
  security_group_id = module.alb_ingress_sg.sg_id
}
resource "aws_security_group_rule" "alb_ingress_bastion_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id       = module.bastion_sg.sg_id
  security_group_id = module.alb_ingress_sg.sg_id
}
resource "aws_security_group_rule" "alb_ingress_public_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.alb_ingress_sg.sg_id
}
# JDOPS-32, Bastion host should be accessed from office n/w
resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion_sg.sg_id
}
resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id = module.mysql_sg.sg_id
}
resource "aws_security_group_rule" "mysql_eks_node" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.eks_node_sg.sg_id
  security_group_id = module.mysql_sg.sg_id
}
resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.sg_id
  security_group_id = module.eks_control_plane_sg.sg_id
}
resource "aws_security_group_rule" "eks_node_alb_ingress" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.alb_ingress_sg.sg_id
  security_group_id = module.eks_node_sg.sg_id
}

