variable "compartment_ocid" {}

variable "region" {
    default = "uk-london-1"
}
variable "bucket_namespace" {
    default = "oraseemeaukcore"
}
variable "bucket_name" {
    default = "resource_manager_demo_bucket_benh"
}

provider "oci" {
    region = var.region
}

resource "oci_objectstorage_bucket" "create_bucket" {
    # required
    compartment_id = var.compartment_ocid
    name = var.bucket_name
    namespace = var.bucket_namespace

    # optional
    access_type = "NoPublicAccess" # <---- updated from "ObjectRead"
}

output "new_bucket" {
    value = oci_objectstorage_bucket.create_bucket
}