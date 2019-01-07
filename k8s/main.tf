provider "kubernetes" {
  host = "https://10.96.0.1"
}

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx-ex"
    labels {
      App = "nginx"
    }
  }

  spec {
    container {
      image = "nginx:latest"
      name = "example"

      port {
        container_port = 80
      }
    }
  }
}









