module "google_compute_network" {
    source = "./google_compute_network"
}

module "google_compute_subnetwork" {
    source = "./google_compute_subnetwork"
    hub_network_uri = module.google_compute_network.hub_network_uri
    spoke_network_uri = module.google_compute_network.spoke_network_uri
    depends_on = [ module.google_compute_network ]
}

module "google_compute_network_peering" {
    source = "./google_compute_network_peering"
    hub_network_uri = module.google_compute_network.hub_network_uri
    spoke_network_uri = module.google_compute_network.spoke_network_uri
    depends_on = [ module.google_compute_subnetwork ]
}

module "google_compute_vpn_gateway" {
    source = "./google_compute_vpn_gateway"
    hub_network_uri = module.google_compute_network.hub_network_uri
    depends_on = [ module.google_compute_network_peering ]
}

module "google_compute_vpn_tunnel" {
    source = "./google_compute_vpn_tunnel"
    vpn_gateway_id = module.google_compute_vpn_gateway.vpn_gateway_id
}

module "google_compute_route" {
    source = "./google_compute_route"
    hub_network_uri = module.google_compute_network.hub_network_uri
    spoke_network_uri = module.google_compute_network.spoke_network_uri
    vpn_tunnel_uri = module.google_compute_vpn_tunnel.vpn_tunnel_uri
    depends_on = [ module.google_compute_vpn_tunnel ]
}