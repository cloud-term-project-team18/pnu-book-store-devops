resource "ncloud_route_table" "kubernetes_route_table" {
    vpc_no                  = ncloud_vpc.main.id
    supported_subnet_type   = "PRIVATE"
    name                    = "kubernetes-route-table"
}

resource "ncloud_route" "kubernetes_route" {
    route_table_no          = ncloud_route_table.kubernetes_route_table.id
    destination_cidr_block  = "0.0.0.0/0"
    target_type             = "NATGW"
    target_name             = ncloud_nat_gateway.nat_gateway.name
    target_no               = ncloud_nat_gateway.nat_gateway.id
}

resource "ncloud_route_table_association" "kubernetes_route_table_subnet" {
  route_table_no = ncloud_route_table.kubernetes_route_table.id
  subnet_no      = ncloud_subnet.private_lb_subnet.id
}