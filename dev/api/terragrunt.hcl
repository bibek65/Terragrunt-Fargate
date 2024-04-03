locals{ 
    env_vars= merge(read_terragrunt_config(find_in_parent_folders("common_vars.hcl")).locals, read_terragrunt_config("${get_repo_root()}/global_vars.hcl").locals)
}

include "root"{
    path = find_in_parent_folders()
}

include "env"{
    path = "${get_repo_root()}/_env/ecs.hcl"
}

inputs = {
    vpc_subnet_module = {
    name                 = "ecs-vpc-subnet-network"
    cidr_block           = "10.0.0.0/16"
    azs                  = ["us-east-1a", "us-east-1b"]
    public_subnets       = ["10.0.101.0/24", "10.0.102.0/24"]
    enable_nat_gateway   = false 
    }
}
  


