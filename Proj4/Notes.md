Folder structure for a Terraform project that includes examples of using multiple providers and organizing your configuration files. 
I’ll provide an overview of the folder structure and then explain how to run Terraform code within that structure.

### Folder Structure

```
terraform-project/
├── aws/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── outputs.tf
├── google/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── outputs.tf
└── multi-providers/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf
```

### Explanation of Each Folder and Files

#### 1. **AWS Provider Folder (`aws/`)**

This folder contains configurations specific to the AWS provider.

- **`aws/provider.tf`**: Defines the AWS provider configuration.
- **`aws/main.tf`**: Contains resources managed by AWS.
- **`aws/variables.tf`**: Defines any variables used in the AWS configuration.
- **`aws/outputs.tf`**: Defines outputs to be displayed after Terraform applies.

**Example Files:**

**aws/provider.tf**
```hcl
provider "aws" {
  region = "us-west-2"
}
```

**aws/main.tf**
```hcl
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Update with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "aws-example-instance"
  }
}
```

**aws/variables.tf**
```hcl
variable "instance_type" {
  description = "Type of instance"
  default     = "t2.micro"
}
```

**aws/outputs.tf**
```hcl
output "instance_id" {
  value = aws_instance.example.id
}
```

#### 2. **Google Cloud Provider Folder (`google/`)**

This folder contains configurations specific to the Google Cloud provider.

- **`google/provider.tf`**: Defines the Google Cloud provider configuration.
- **`google/main.tf`**: Contains resources managed by Google Cloud.
- **`google/variables.tf`**: Defines any variables used in the Google Cloud configuration.
- **`google/outputs.tf`**: Defines outputs to be displayed after Terraform applies.

**Example Files:**

**google/provider.tf**
```hcl
provider "google" {
  project = "my-gcp-project-id"
  region  = "us-central1"
}
```

**google/main.tf**
```hcl
resource "google_compute_instance" "example" {
  name         = "google-example-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

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
```

**google/variables.tf**
```hcl
variable "instance_type" {
  description = "Type of instance"
  default     = "f1-micro"
}
```

**google/outputs.tf**
```hcl
output "instance_id" {
  value = google_compute_instance.example.id
}
```

#### 3. **Multiple Providers Folder (`multi-providers/`)**

This folder demonstrates using multiple providers in a single configuration.

- **`multi-providers/main.tf`**: Contains configurations for multiple providers (AWS and Google Cloud).
- **`multi-providers/variables.tf`**: Defines any variables used in the multi-provider configuration.
- **`multi-providers/outputs.tf`**: Defines outputs for resources created by both providers.

**Example Files:**

**multi-providers/main.tf**
```hcl
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
```

**multi-providers/variables.tf**
```hcl
variable "aws_region" {
  description = "The AWS region to deploy resources"
  default     = "us-west-2"
}

variable "google_project" {
  description = "The Google Cloud project ID"
  default     = "my-gcp-project-id"
}
```

**multi-providers/outputs.tf**
```hcl
output "aws_instance_id" {
  value = aws_instance.aws_example.id
}

output "google_instance_id" {
  value = google_compute_instance.google_example.id
}
```

### How to Run Terraform Code

#### 1. **Single Provider (AWS or Google Cloud)**

1. **Navigate to the provider folder:**

   For AWS:
   ```sh
   cd terraform-project/aws
   ```

   For Google Cloud:
   ```sh
   cd terraform-project/google
   ```

2. **Initialize Terraform:**
   ```sh
   terraform init
   ```

3. **Plan and apply the configuration:**
   ```sh
   terraform plan
   terraform apply
   ```

#### 2. **Multiple Providers**

1. **Navigate to the multi-providers folder:**
   ```sh
   cd terraform-project/multi-providers
   ```

2. **Initialize Terraform:**
   ```sh
   terraform init
   ```

3. **Plan and apply the configuration:**
   ```sh
   terraform plan
   terraform apply
   ```

### Summary

- **AWS Folder**: Contains configurations specific to AWS.
- **Google Cloud Folder**: Contains configurations specific to Google Cloud.
- **Multiple Providers Folder**: Demonstrates how to use multiple providers in a single configuration.

Replace placeholder values such as `ami-0c55b159cbfafe1f0` and `my-gcp-project-id` with actual values suitable for your environment.
