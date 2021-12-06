############################################################################
# Variables:
############################################################################

############################################################################
# Tenancy:
############################################################################

variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_id"{}
variable "customer_label"{}

############################################################################
# IPs:
############################################################################

locals {
  ips = {
    vcn         = "10.199.0.0/22"
    sub  = "10.199.0.0/26"
    
    access      = {
      v1_anthony   = "37.228.201.25/32"
      
    }
    
  }
}

############################################################################
# Instances:
############################################################################

locals {
  
  oracle_images = {
    oel610_frankfurt  = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa3ckej2udki5yrov5pln4xg7z7bc6jwlmxx3mx2k5tmynnllb3jhq"
    oel79_frankfurt   = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaf6gm7xvn7rhll36kwlotl4chm25ykgsje7zt2b4w6gae4yqfdfwa"
    # win2016_e3_london = "ocid1.image.oc1.uk-london-1.aaaaaaaa44tdm3ytd6coogcc3wpvvgpeothw3p4luvsmsi3l5ethcxkm6eiq"
  }
  shapes = {
    e2-1m = "VM.Standard.E2.1.Micro"
    e2-1  = "VM.Standard.E2.1"
    e2-2  = "VM.Standard.E2.2"
    e2-4  = "VM.Standard.E2.4"
    s2-1  = "VM.Standard2.1"
    s2-2  = "VM.Standard2.2"
    s2-4  = "VM.Standard2.4"
    s2-8  = "VM.Standard2.8"
    s2-16 = "VM.Standard2.16"
    e3    = "VM.Standard.E3.Flex"
  }
  gmp_domain = "GMP.Police.UK"
}

############################################################################
# VCN:
############################################################################

locals {
  vcns = {
    vcn1 = {
      vcn_dns_label      = "${var.customer_label}vcn"
      vcn_cidr_block     = local.ips["vcn"]
      vcn_compartment_id = var.compartment_id
      subnets = {
        dmz = {
          subnet_cidr_block  = local.ips["sub"]
          subnet_dns_label   = "${var.customer_label}dmz"
          subnet_is_private  = false
          subnet_route_table = "dmz"
        }
        
      
    
        }
      }
    }
}
  


############################################################################
# VPN:
############################################################################

