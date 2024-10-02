resource "yandex_compute_instance" "instances" {
  name        = var.vm_name
  hostname    = var.vm_name
 
  zone        = var.zone
  resources {
    cores         = var.cpu
    memory        = var.memory
    
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = var.nat
    ip_address         = var.internal_ip_address
    nat_ip_address     = var.nat_ip_address
  }

  metadata = {
    ssh-keys           = "${var.vm_user}:${file(var.public_key_path)}"
  }
}
