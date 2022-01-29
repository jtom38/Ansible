
provider "docker" {
    host = "http://192.168.0.241:2375"
}



resource "docker_image" "nextcloud" {
    name = "nextcloud:19.0.1-apache"
}

resource "docker_image" "postgres" {
    name = "postgres:12.3"
}

resource "docker_image" "redis" {
    name = "redis:6.0.6-alpine"
}

resource "docker_image" "proxy" {
    name = "nginx:1.19.1-alpine"
}



resource "docker_volume" "nextcloud_web_data" {
    name = "nextcloud_web_data"
}

resource "docker_volume" "nextcloud_db_data" {
    name = "nextcloud_db_data"
}

resource "docker_network" "nextcloud" {
    name = "nextcloud"
    driver = "bridge"
    ipam_config {
        subnet = "172.200.0.0/16"
        gateway = "172.200.0.1"
    }
}

resource "docker_container" "nextcloud_proxy" {
    count = 1
    name = "nextcloud_proxy_${count.index}"
    image = docker_image.proxy.latest

    ports {
        internal = 80
        external = 80
    }

    upload {
        file = "/etc/nginx/nginx.conf"
        #content = file("nextcloud.conf")
        content = <<EOF
events { }
http {

    upstream nextcloud {
        server ${docker_container.nextcloud_web.network_data.ip_address}:80;
    }

    server {
        server_name example.local;
        location / {
            proxy_pass http://nextcloud_web_0:80;
        }

        location /nextcloud {
            proxy_pass http://nextcloud;
        }
    }
        EOF
    }

    networks_advanced {
        name = docker_network.nextcloud.name
    }
}

resource "docker_container" "nextcloud_cache" {
    count = 1
    name = "nextcloud_cache_${count.index}"
    image = docker_image.redis.latest

    ports {
        internal = 6379
        external = 6379
    }

    #env = ["value"]

    networks_advanced {
        name = docker_network.nextcloud.name        
    }
}

resource "docker_container" "nextcloud_db" {
    count = 1
    name = "nextcloud_db_${count.index}"
    image = docker_image.postgres.latest

    ports {
        internal = 5432
        external = 5432
    }

    volumes {
        volume_name = docker_volume.nextcloud_db_data.name
        container_path = "/var/lib/postgresql/data"
    }

    env = [
        "POSTGRES_PASSWORD=password",
        "POSTGRES_DB=nextcloud",
        "POSTGRES_USER=nextcloudAdmin"
    ]
    
    networks_advanced {
        name = docker_network.nextcloud.name
        #ipv4_address = "172.200.0.11"
    }
}

resource "docker_container" "nextcloud_web" {
    #count = 2
    #name = "nextcloud_web_${count.index}"
    name = "nextcloud_web_0"

    image = docker_image.nextcloud.latest

    ports {
        internal = 80
        #external = 8080
    }

    volumes {
        volume_name = docker_volume.nextcloud_web_data.name
        container_path = "/var/www/html"
    }

    env = [
        "POSTGRES_DB=nextcloud",
        "POSTGRES_USER=nextcloudAdmin",
        "POSTGRES_PASSWORD=password",
        "POSTGRES_HOST=nextcloud_db_0",
        "REDIS_HOST=nextcloud_cache_1",
        "REDIS_HOST_PORT=6379"
    ]

    networks_advanced {
        name = docker_network.nextcloud.name
        #ipv4_address = "172.200.0.10"
    }

}