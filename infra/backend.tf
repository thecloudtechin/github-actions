terraform {
  backend "s3" {
    bucket = "terraform-state-vp1234"
    key = "terraform-state-vp1234/backned"
    region = "ap-south-1"
  }


}
