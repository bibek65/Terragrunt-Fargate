locals{ 
    env_vars= merge(read_terragrunt_config(find_in_parent_folders("common_vars.hcl")).locals, read_terragrunt_config("${get_repo_root()}/global_vars.hcl").locals)
}

include "root"{
    path = find_in_parent_folders()
}

include "env"{
    path = "${get_repo_root()}/_env/vpc-subnet.hcl"
}



