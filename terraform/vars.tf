variable "project_id" {
  description = "ID du projet GCP"
  type        = string
  default = "mspr-462120"
}

variable "region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "Zone GCP"
  type        = string
  default     = "europe-west3-b"
}

variable "instance_name" {
  description = "Nom de l'instance"
  type        = string
  default     = "vm-terra-packer"
}

variable "machine_type" {
  description = "Type de machine"
  type        = string
  default     = "e2-medium"
}

variable "image_project" {
  description = "Projet contenant l'image packer"
  type        = string
  default = "mspr-462120"
}

variable "image_name" {
  description = "Nom de l'image packer"
  type        = string
  default = "packer-1749492436"
}