
############################################################################
# VCN:
############################################################################

module "vcn" {
  source             = "./modules/tf-oci-core-mod-vcn" # "git::https://git.version1.com/scm/ivo/tf-oci-core-mod-vcn.git"
  vcn_inputs         = local.vcns
  #dhcp_options       = oci_core_dhcp_options.dhcp_options_gmp_dns.id
}

############################################################################

