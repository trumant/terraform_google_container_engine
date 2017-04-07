resource "google_container_cluster" "staging-gkecluster" {
  name = "staging-gkecluster"
  zone = "us-central1-a"
  initial_node_count = 2

  additional_zones = [
    "us-central1-b",
  ]

  master_auth {
    username = "mr.yoda"
    password = "adoy.rm"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    machine_type = "n1-standard-1"
  }
}

output "endpoint" {
  value = "${google_container_cluster.staging-gkecluster.endpoint}"
}

output "client_certificate" {
  value = "${google_container_cluster.staging-gkecluster.master_auth.0.client_certificate}"
}

output "client_key" {
  value = "${google_container_cluster.staging-gkecluster.master_auth.0.client_key}"
}

output "cluster_ca_certificate" {
  value = "${google_container_cluster.staging-gkecluster.master_auth.0.cluster_ca_certificate}"
}