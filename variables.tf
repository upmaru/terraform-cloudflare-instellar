variable "zone_name" {
  description = "Zone you want to use for creating a tunnel"
  type        = string
}

variable "blueprint" {
  description = "The identifier of the blueprint"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare account id"
  type        = string
  sensitive   = true
}

variable "identifier" {
  description = "Identifier for the tunnel"
  type        = string
}

variable "emails" {
  description = "Emails of users who can access the tunnel"
  type        = list(string)
}