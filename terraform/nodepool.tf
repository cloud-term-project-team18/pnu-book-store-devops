resource "ncloud_nks_node_pool" "node_pool" {
    cluster_uuid        = ncloud_nks_cluster.cluster.uuid
    node_pool_name      = "cloud-node-pool"
    node_count          = 1
    product_code        = "SVR.VSVR.STAND.C002.M008.NET.SSD.B050.G002"
    subnet_no_list      = [ncloud_subnet.private_sbn1.id, ncloud_subnet.private_sbn2.id, ncloud_subnet.private_sbn3.id]
    autoscale {
        enabled     = true
        min         = 1
        max         = 3
    }
}

