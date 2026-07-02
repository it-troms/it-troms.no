job "it-troms" {
  namespace = "itft"
  datacenters = ["dc1"]
  type = "service"

  group "app" {
    network {
      mode = "bridge"

      port "http" {
        static       = 9080
        to           = 8080
        host_network = "loopback"
      }
    }

    task "it-troms" {
      driver = "docker"

      config {
        image = "ghcr.io/it-troms/it-troms.no:latest"
        force_pull = true
        ports = ["http"]
      }

      resources {
        cpu    = 250
        memory = 256
      }

      service {
        provider = "nomad"
        name     = "it-troms"
        port     = "http"

        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}
