locals {
  azs = slice(data.aws_availability_zones.available_zones.names, 0, 3)
}
