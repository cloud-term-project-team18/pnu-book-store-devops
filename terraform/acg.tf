resource "ncloud_access_control_group" "acg" {
    name        = "cloudteam18"
    vpc_no      = ncloud_vpc.main.id
}

resource "ncloud_access_control_group_rule" "acg-rule" {
    access_control_group_no    = ncloud_access_control_group.acg.id

    inbound {
        protocol        = "TCP"
        ip_block        = "0.0.0.0/0"
        port_range      = "443"
    }

    inbound {
        protocol        = "TCP"
        ip_block        = "0.0.0.0/0"
        port_range      = "80"
    }

    outbound { 
        protocol        = "TCP"
        ip_block        = "0.0.0.0/0"
        port_range      = "1-65535"
    }
}