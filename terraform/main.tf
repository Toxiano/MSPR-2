resource "google_compute_instance" "vm_from_packer_image" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "projects/${var.image_project}/global/images/${var.image_name}"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Instance from Packer image ready."
  EOT

  metadata = {
    ssh-keys = "admin:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM+KPmnHmQyvMA59BSF2Q8kBAtNUficFv6LnhLI4r/IJ github-deploy"
  }

  tags = ["web"]
}

output "instance_ip" {
  value = google_compute_instance.vm_from_packer_image.network_interface[0].access_config[0].nat_ip
}