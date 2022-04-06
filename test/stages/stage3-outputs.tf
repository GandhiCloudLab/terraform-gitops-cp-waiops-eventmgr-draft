
 resource null_resource write_outputs {
   provisioner "local-exec" {
     command = "echo \"$${OUTPUT}\" > gitops-output.json"

     environment = {
       OUTPUT = jsonencode({
         name        = module.gitops_cp_waiops_eventmgr.name
         branch      = module.gitops_cp_waiops_eventmgr.branch
         layer       = module.gitops_cp_waiops_eventmgr.layer
         layer_dir   = module.gitops_cp_waiops_eventmgr.layer == "infrastructure" ? "1-infrastructure" : (module.gitops_cp_waiops_eventmgr.layer == "services" ? "2-services" : "3-applications")
         type        = module.gitops_cp_waiops_eventmgr.type
       })
     }
   }
}