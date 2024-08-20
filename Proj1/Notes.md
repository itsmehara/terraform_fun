Below is a guide on getting started with Terraform, including installation, HashiCorp Configuration Language (HCL) basics, and how to update and destroy infrastructure. Sample code and data, as well as instructions on how to run it.

### 1. Getting Started with Terraform

#### *Installing Terraform*

To install Terraform, follow these steps:

1. **Download Terraform:**
   Visit the [Terraform downloads page](https://www.terraform.io/downloads.html) and download the appropriate package for your operating system.

2. **Install Terraform:**
   - For macOS:
     ```sh
     brew tap hashicorp/tap
     brew install hashicorp/tap/terraform
     ```
   - For Linux:
     ```sh
     sudo apt-get update
     sudo apt-get install -y gnupg software-properties-common
     sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xC2C12A8F
     sudo add-apt-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
     sudo apt-get update
     sudo apt-get install terraform
     ```
   - For Windows:
     Unzip the downloaded file and move `terraform.exe` to a directory included in your PATH (e.g., `C:\Program Files\Terraform`).

3. **Verify Installation:**
   ```sh
   terraform version
   ```

#### *HashiCorp Configuration Language (HCL)*

HCL is a domain-specific language used by Terraform. Here’s a basic example:

**Sample Configuration File (main.tf):**
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```

#### *Update and Destroy Infrastructure*

**Update Infrastructure:**

1. Make changes to your `.tf` files.
2. Run `terraform plan` to see the changes Terraform will make.
   ```sh
   terraform plan
   ```
3. Apply the changes.
   ```sh
   terraform apply
   ```

**Destroy Infrastructure:**

1. Run `terraform destroy` to remove all resources managed by your configuration.
   ```sh
   terraform destroy
   ```

#### *Code Samples: HCL Basics*

Here are some basic code samples to get you started with HCL:

**1. Provider Configuration:**

**provider.tf**
```hcl
provider "aws" {
  region = "us-west-2"
}
```

**2. Defining a Resource:**

**instance.tf**
```hcl
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI ID, change as needed
  instance_type = "t2.micro"

  tags = {
    Name = "my-instance"
  }
}
```

**3. Output Variables:**

**outputs.tf**
```hcl
output "instance_id" {
  value = aws_instance.my_instance.id
}
```

**4. Variables:**

**variables.tf**
```hcl
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-west-2"
}
```

**5. Using Variables:**

**main.tf**
```hcl
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}
```

#### *How to Run Terraform Code*

1. **Initialize Terraform:**
   Run this command in the directory containing your `.tf` files to initialize the working directory:
   ```sh
   terraform init
   ```

2. **Review the Plan:**
   Generate and review an execution plan:
   ```sh
   terraform plan
   ```

3. **Apply the Configuration:**
   Apply the changes required to reach the desired state:
   ```sh
   terraform apply
   ```

4. **Destroy Infrastructure (Optional):**
   To clean up resources:
   ```sh
   terraform destroy
   ```

**Example Data for the AWS Instance:**
- **AMI ID:** `ami-0c55b159cbfafe1f0` (Make sure this ID is valid for your region.)
- **Instance Type:** `t2.micro`
- **Region:** `us-west-2`

**Sample Directory Structure:**
```
terraform-project/
├── main.tf
├── provider.tf
├── instance.tf
├── variables.tf
└── outputs.tf
```

Feel free to modify the example configuration files to fit your specific needs.
