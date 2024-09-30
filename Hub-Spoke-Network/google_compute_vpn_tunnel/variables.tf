variable "vpn_gateway_id" {
    description = "The ID of the VPN Gateway"
    type = string
}

variable "peer_ip" {
    description = "The IP of the Peer"
    type = string
    sensitive = true
    default = "test123"
}

variable "shared_secret" {
    description = "The value of the Shared Secret"
    type = string
    sensitive = true
    default = "test123"
}