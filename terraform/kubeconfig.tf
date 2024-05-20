resource "null_resource" "kubeconfig" {
  depends_on = [ncloud_nks_cluster.cluster]

  provisioner "local-exec" {
    command = "ncp-iam-authenticator create-kubeconfig --region KR --clusterUuid ${ncloud_nks_cluster.cluster.uuid} --output ${path.module}/k8s/kubeconfig.yaml"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}
