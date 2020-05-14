module "wordpress_network" {
  source        = "github.com/jonpulsifer/terraform-modules//gce-vpc"
  name          = "wordpress"
  subnet_name   = "vms"
  ip_cidr_range = "172.16.0.0/28"
  external_ssh  = true
}
