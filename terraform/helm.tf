# provider "helm" {
#     # depends_on
#     kubernetes {
#         config_path = local_file.kubeconfig.filename
#     }
# }

# resource "helm_release" "elasticsearch" {
#     name        = "elasitcsearch"
#     repository  = "https://helm.elastic.co"
#     chart       = "elasticsearch"
#     version     = "8.5.1"
#     namespace   = kubernetes_namespace.efk.metadata[0].name

#     set {
#         name    = "replicas"
#         value   = "1"
#     }

#     set {
#         name    = "esJavaOpts"
#         value   = "-Xms1g -Xmx1g"
#     }

#     set {
#         name    = "minimumMasterNodes"
#         value   = "1"
#     }

#     set {
#         name    = "resources.limits.memory"
#         value   = "6Gi"
#     }

# }

# resource "helm_release" "kibana" {
#   name       = "kibana"
#   repository = "https://helm.elastic.co"
#   chart      = "kibana"
#   version     = "8.5.1"
#   namespace  = kubernetes_namespace.efk.metadata[0].name

#   set {
#     name  = "elasticsearchHosts"
#     value = "http://elasticsearch-master:9200"
#   }

#   set {
#     name  = "service.type"
#     value = "LoadBalancer"
#   }

#   set {
#     name  = "resources.requests.memory"
#     value = "1Gi"  # 컨테이너가 요청하는 메모리 양
#   }

#   set {
#     name  = "resources.limits.memory"
#     value = "1Gi"  # 컨테이너가 사용할 수 있는 최대 메모리 양
#   }
# }