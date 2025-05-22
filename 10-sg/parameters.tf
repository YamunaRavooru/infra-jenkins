# resource "aws_ssm_parameter" "mysql_sg_id" {
#   name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
#   type  = "String"
#   value = module.sg_mysql.sg_id
# }
# resource "aws_ssm_parameter" "bastion_sg_id" {
#   name  = "/${var.project_name}/${var.environment}/bastion_sg_id"
#   type  = "String"
#   value = module.sg_bastion.sg_id
# }
# resource "aws_ssm_parameter" "ingress_alb_sg_id" {
#   name  = "/${var.project_name}/${var.environment}/ingress_alb_sg_id"
#   type  = "String"
#   value = module.sg_ingress_alb.sg_id
# }
# resource "aws_ssm_parameter" "eks_contol_plane_sg_id" {
#   name  = "/${var.project_name}/${var.environment}/eks_contol_plane_sg_id"
#   type  = "String"
#   value = module.sg_eks_control_plane.sg_id
# }
# resource "aws_ssm_parameter" "node_eks_sg_id" {
#   name  = "/${var.project_name}/${var.environment}/node_eks_sg_id"
#   type  = "String"
#   value = module.sg_node_eks.sg_id
# }
resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
  type  = "String"
  value = module.mysql_sg.sg_id
}
resource "aws_ssm_parameter" "bastion_sg_id" {
  name  = "/${var.project_name}/${var.environment}/bastion_sg_id"
  type  = "String"
  value = module.bastion_sg.sg_id
}
resource "aws_ssm_parameter" "alb_ingress_sg_id" {
  name  = "/${var.project_name}/${var.environment}/alb_ingress_sg_id"
  type  = "String"
  value = module.alb_ingress_sg.sg_id
}
resource "aws_ssm_parameter" "eks_control_plane_sg_id" {
  name  = "/${var.project_name}/${var.environment}/eks_control_plane_sg_id"
  type  = "String"
  value = module.eks_control_plane_sg.sg_id
}
resource "aws_ssm_parameter" "eks_node_sg_id" {
  name  = "/${var.project_name}/${var.environment}/eks_node_sg_id"
  type  = "String"
  value = module.eks_node_sg.sg_id
}









