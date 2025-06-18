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
    ssh-keys = "admin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCbJKXhC6V7SjOLUZVvu2iGnNq11QtxlPYoqAopgkohT5E/Ywbh+rr16A5yhhVJtsZZy+9judMw7oKvTDXbqv9tdKi5Jz1slMBWf5ID4p2UE4T+E3cB1f9cN3XQoM6hbYzxnE5Qzwjbdf5jna59U2I9eLY0P43KC4dY/+eJQAneK/hWM4nJjMStz2semHFzxAaw85fTjj5ENNAuzlFKg48lzlAZSJRHYIrVc2cOs3Q71cgZQVG5ypRR4xqXD0eX/DoKWExuxFgnpg0iVXii5Hdt6TtxnA1CZyaWwuDC1On9BefIKFEOU9qEHfKrye+AAOCLa8KBifnItRMH/obY7AodpjmdRW2WXOm7yA13A6ckNWNU5zV016B/hLzW+mSM+WxLIDN9uhG8P7s8S7ym2NvwJ4c6UK5b4fZBvoQW9BeNZF1D82SggFVQgfWNXB0wyEpb9fDFU9nejnL8PbakMP1juTgQpdh8+hDc7gznpLO0UQNoMxUmUHCt8Y7aIfClxz0OzHRdNiVKDUA5HrHONPux7c0wgP9kPLvWs9vJcXZaftobpFYexoFyPF16xQhMhNLOM0tg6RaWR0GV+/9U8v/BDMKeCZY6nuWjWroZu4heh6o6VXfoMwmal6gFT5ogZyaVLIVl2LOoB4e9eYOoxYyHwWjvNwhTAveGsB/fbAHfiw== admin-key"
  }

  tags = ["web"]
}

output "instance_ip" {
  value = google_compute_instance.vm_from_packer_image.network_interface[0].access_config[0].nat_ip
}