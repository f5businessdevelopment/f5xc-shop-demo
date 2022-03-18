resource "kubernetes_secret" "registry-secret" {
    metadata {
        name = "f5demos-registry-secret"
        namespace = var.namespace
        annotations = {
            "ves.io/virtual-sites" = "$${namespace}/$${spoke_vsite}"
        }
    }
    data = {
        ".dockerconfigjson" = var.registry_config_json
    }
    type = "kubernetes.io/dockerconfigjson"
}