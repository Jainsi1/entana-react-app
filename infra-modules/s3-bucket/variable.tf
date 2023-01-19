variable "bucket_name" {
  type = string
  description = "Name of the bucket"
  default = "entana-react-bucket"
}
variable "acl_value" {

    default = "private"

}
variable versioning {
  type        = bool
  default     = true
  description = "Flag to determine whether bucket versioning is enabled or not"
}
variable "bucket_id" {
  
}
