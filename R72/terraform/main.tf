
   ndex" {
  service_account_key_file = "key.json"
  cloud_id  = "b1gcdtbrs5t30g9hlt4n"
  folder_id = "b1gbmdc9gldttjj6048d"
  zone      = "ru-central1-a"
}

# 3-4
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

# 5

# does not start without a network


resource "yandex_vpc_network" "net" {
  name = "net"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  network_id     = resource.yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.1.0/24"]
  zone           = "ru-central1-a"
}

resource "yandex_compute_instance" "vm" {
  name        = "node01"
  platform_id = "standard-v1"

  resources {
    cores         = 1
    memory        = 1
    core_fraction = 100
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
    ipv6      = false
  }

}
= "auth_token_here"
