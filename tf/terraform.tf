terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.5"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "~>2.2.3"
    }
    http = {
      source  = "hashicorp/http"
      version = "~>3.2.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0.0"
    }
  }
}

# Use this to upgrade to latest providers
# tf init -upgrade