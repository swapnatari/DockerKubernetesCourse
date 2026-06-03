
# resource "aws_s3_bucket" "my_bucket" {
# #   bucket = "swapna1999"
#   count = 3
#   bucket = count.index==1 ? "swapna-bucket-name" : "swapna-bucket-name-${count.index}"
#   tags = {
#     Name = "My bucket"
#     Environment = "Dev"
#   }
# }

module "s3bucket" {
  source = "./s3bucket"
  bucket_name = var.bucket_name
  region      = var.region
  environment   = var.environment
}
module "vpc" {
  source = "./vpc"
  cidr_block = var.cidr_block
}

module "subnet" {
  depends_on = [module.vpc]
  source = "./subnet"
  vpc_id = module.vpc.vpc_id
  route_table_id = module.vpc.route_table_id
  cidr_block = var.subnet_cidr_block
  subnet_cidr_1 = var.subnet_cidr_1
  subnet_cidr_2 = var.subnet_cidr_2
}

module "ec2Instance" {
   source = "./ec2Instance"
   subnet_id = module.subnet.aws_subnet
   ami_id = data.aws_ami.ubuntu.id
}

module "ecs" {
  source       = "./ecs"
  cluster_name = var.ecs_cluster_name
}

module "eks" {
  depends_on = [module.subnet]
  source = "./eks"
  cluster_name = var.eks_cluster_name
  vpc_id = module.vpc.vpc_id
  subnet_ids = [
  module.subnet.subnet1_id,
  module.subnet.subnet2_id
]
}

module "ecr" {
 source = "./ecr"
 repository_name = var.ecr_repository_name
}