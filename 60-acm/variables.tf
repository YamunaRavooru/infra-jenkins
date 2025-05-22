variable "project_name"{
    default ="expense"
    }
    variable "environment"{
        default="dev"
    }
    variable "domain_name"{
        default="daws82s.cloud"
    }
    variable "common_tags"{
    default={
        project_name ="expense"
        environment="dev"
        terraform= true
    }
}
variable "zone_id"{
    default="Z10470331A87DVPOT82Q9"
}