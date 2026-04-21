resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace_v1.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version

  create_namespace = false
  wait             = true
  timeout          = 2700

  values = [
    yamlencode({
      global = {
        domain = var.hostname
      }

      configs = {
        params = {
          "server.insecure" = tostring(var.admin_insecure)
        }
      }

      server = {
        service = {
          type = "ClusterIP"
        }
        extraArgs = {
          "insecure" = tostring(var.admin_insecure)
          "rootpath"  = "/argocd"
          "basehref"  = "/argocd"
        }
      }
    })
  ]

  depends_on = [
    kubernetes_namespace_v1.argocd
  ]
}