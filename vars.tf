variable "resource_group_name" {
  type = string
  description = "Nombre del resource_group"
  default = "kubernetes_p2_rg"
}

variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "Switzerland North"
}

variable "master_vm_size" {
  type = string
  description = "Tamaño de la máquina virtual Master"
  default = "B2s" # 4.0 GB, 2 CPU
}

variable "worker_nfs_vm_size" {
  type = string
  description = "Tamaño de la máquina virtual Worker y NFS"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU
}