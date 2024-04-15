resource "random_password" "this" {
  length = 64
}

data "cloudflare_zone" "this" {
  name = var.zone_name
}

resource "cloudflare_tunnel" "this" {
  account_id = var.cloudflare_account_id
  name       = var.identifier
  secret     = base64sha256(random_password.this.result)
}

resource "cloudflare_record" "this" {
  zone_id = data.cloudflare_zone.this.id
  name    = var.identifier
  value   = cloudflare_tunnel.this.cname
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_tunnel_config" "this" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudfalre_tunnel.this.id

  config {
    ingress_rule {
      hostname = cloudflare_record.this.hostname
      service  = "ssh://localhost:22"
    }
  }
}

resource "cloudflare_access_application" "this" {
  zone_id          = data.cloudflare_zone.this.id
  name             = "Access application ssh access for ${var.identifier}"
  domain           = "${var.identifier}.${var.zone_name}"
  session_duration = "1h"
}

resource "cloudflare_access_policy" "this" {
  application_id = cloudflare_access_application.this.id
  zone_id        = data.cloudflare_zone.this.id
  name           = "Access policy ssh access for ${var.identifier}"
  precedence     = "1"
  decision       = "allow"
  include {
    email = var.emails
  }
}
