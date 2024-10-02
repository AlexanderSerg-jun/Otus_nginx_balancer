
output "instance_external_ip_address" {
  value = yandex_compute_instance.instances.network_interface.0.nat_ip_address
}

output "instance_internal_ip_address" {
  value = yandex_compute_instance.instances.network_interface.0.ip_address
}