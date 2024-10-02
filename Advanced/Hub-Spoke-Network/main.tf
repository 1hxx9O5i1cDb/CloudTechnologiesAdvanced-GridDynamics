module "google_compute_network" {
    source = "./google_compute_network"
}

module "google_compute_subnetwork" {
    source = "./google_compute_subnetwork"
    hub_network_uri = module.google_compute_network.hub_network_uri
    spoke_network_uri = module.google_compute_network.spoke_network_uri
    depends_on = [ module.google_compute_network ]
}

module "google_compute_firewall" {
    source = "./google_compute_firewall"
    hub_network_uri = module.google_compute_network.hub_network_uri
    spoke_network_uri = module.google_compute_network.spoke_network_uri
    depends_on = [ module.google_compute_subnetwork ]
}

module "google_compute_network_peering" {
    source = "./google_compute_network_peering"
    hub_network_uri = module.google_compute_network.hub_network_uri
    spoke_network_uri = module.google_compute_network.spoke_network_uri
    depends_on = [ module.google_compute_firewall ]
}

module "google_compute_vpn_gateway" {
    source = "./google_compute_vpn_gateway"
    hub_network_uri = module.google_compute_network.hub_network_uri
    depends_on = [ module.google_compute_network_peering ]
}

module "google_compute_address" {
    source = "./google_compute_address"
    depends_on = [ module.google_compute_vpn_gateway ]
}

module "google_compute_forwarding_rule" {
    source = "./google_compute_forwarding_rule"
    vpn_gateway_id = module.google_compute_vpn_gateway.vpn_gateway_id
    ip_address = module.google_compute_address.ip_address
    depends_on = [ module.google_compute_address ]
}

module "google_compute_vpn_tunnel" {
    source = "./google_compute_vpn_tunnel"
    vpn_gateway_id = module.google_compute_vpn_gateway.vpn_gateway_id
    depends_on = [ module.google_compute_forwarding_rule ]
}

module "google_compute_route" {
    source = "./google_compute_route"
    hub_network_uri = module.google_compute_network.hub_network_uri
    vpn_tunnel_id = module.google_compute_vpn_tunnel.vpn_tunnel_id
    depends_on = [ module.google_compute_vpn_tunnel ]
}