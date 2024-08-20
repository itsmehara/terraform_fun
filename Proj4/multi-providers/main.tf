provider "aws" {
  alias  = "aws"
  region = "us-west-2"
}

provider "google" {
  alias  = "google"
  project = "my-gcp-project-id"
  region  = "us-central1"
}

resource "aws_instance" "aws_example" {
  provider      = aws
  ami           = "ami-0c55b159cbfafe1f0"  # Update with a valid AMI ID
  instance_type = "t2.micro"
  tags = {
    Name = "aws-example-instance"
  }
}

resource "google_compute_instance" "google_example" {
  provider      = google
  name          = "google-example-instance"
  machine_type  = "f1-micro"
  zone          = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
