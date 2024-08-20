Below is a detailed guide on using Terraform input variables, understanding the variable block, resource attributes, and resource dependencies. 
For each section, I’ll provide sample code, folder structure, and instructions on how to run the code.

### Terraform Basics

#### 1. *Using Input Variables*

Input variables allow you to parameterize your Terraform configurations.

**Folder Structure:**
```
terraform-variables/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}
```

**`terraform.tfvars`**
```hcl
ami_id = "ami-0c55b159cbfafe1f0"  # Update with a valid AMI ID
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-variables
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

#### 2. *Understanding the Variable Block*

The variable block is used to define the inputs to your configuration. It can include descriptions, types, defaults, and validation.

**Example Files:**

**`variables.tf`**
```hcl
variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be one of t2.micro, t2.small, or t2.medium."
  }
}
```

**Instructions to Run:**

1. **Include this `variables.tf` in your existing configuration.**

2. **Initialize Terraform and apply:**
   ```sh
   terraform init
   terraform apply
   ```

#### 3. *CodeSamples: Variables*

Here's a sample configuration showing how to define and use variables.

**Folder Structure:**
```
terraform-variables-sample/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}
```

**`terraform.tfvars`**
```hcl
ami_id = "ami-0c55b159cbfafe1f0"  # Update with a valid AMI ID
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-variables-sample
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

#### 4. *Using Variables in Terraform*

Variables can be used to parameterize your configuration, making it reusable and flexible.

**Folder Structure:**
```
terraform-variables-use/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "us-west-2"
}
```

**`terraform.tfvars`**
```hcl
ami_id        = "ami-0c55b159cbfafe1f0"  # Update with a valid AMI ID
aws_region    = "us-west-2"
instance_type = "t2.micro"
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-variables-use
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

#### 5. *CodeSamples: Using Variables in Terraform*

This example shows variables in action, with different file setups and usage.

**Folder Structure:**
```
terraform-variables-use-sample/
├── main.tf
├── variables.tf
└── terraform.tfvars
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "sample-instance"
  }
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "AWS region to deploy the resources"
  type        = string
  default     = "us-west-2"
}
```

**`terraform.tfvars`**
```hcl
ami_id        = "ami-0c55b159cbfafe1f0"  # Replace with a valid AMI ID
instance_type = "t2.micro"
aws_region    = "us-west-2"
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-variables-use-sample
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

#### 6. *Resource Attributes*

Resource attributes are used to specify the properties of resources.

**Folder Structure:**
```
terraform-resource-attributes/
├── main.tf
├── variables.tf
└── outputs.tf
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "resource-attributes-example"
  }
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}
```

**`outputs.tf`**
```hcl
output "instance_id" {
  value = aws_instance.example.id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-resource-attributes
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

#### 7. *CodeSamples: Resource Attributes*

This sample includes resource attributes and shows how they are defined.

**Folder Structure:**
```
terraform-resource-attributes-sample/
├── main.tf
├── variables.tf
└── outputs.tf
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "resource-attributes-sample"
  }
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "

instance_type" {
  description = "Type of instance"
  type        = string
}
```

**`outputs.tf`**
```hcl
output "instance_id" {
  value = aws_instance.example.id
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-resource-attributes-sample
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

#### 8. *Resource Dependencies*

Terraform automatically manages dependencies between resources based on their references. You can also explicitly specify dependencies using the `depends_on` meta-argument.

**Folder Structure:**
```
terraform-resource-dependencies/
├── main.tf
├── variables.tf
└── outputs.tf
```

**Example Files:**

**`main.tf`**
```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "example_sg" {
  name = "example_sg"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [aws_security_group.example_sg.name]

  tags = {
    Name = "resource-dependencies-example"
  }

  depends_on = [aws_security_group.example_sg]
}
```

**`variables.tf`**
```hcl
variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}
```

**`outputs.tf`**
```hcl
output "instance_id" {
  value = aws_instance.example.id
}

output "security_group_id" {
  value = aws_security_group.example_sg.id
}
```

**Instructions to Run:**

1. **Navigate to the directory:**
   ```sh
   cd terraform-resource-dependencies
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

- **Using Input Variables**: Parameterize configurations with input variables.
- **Understanding the Variable Block**: Define and validate variables.
- **CodeSamples: Variables**: Examples of defining and using variables.
- **Using Variables in Terraform**: Use variables for configuration flexibility.
- **CodeSamples: Using Variables in Terraform**: Examples showing variable usage.
- **Resource Attributes**: Specify attributes of resources and output values.
- **CodeSamples: Resource Attributes**: Examples of resource attributes.
- **Resource Dependencies**: Manage resource dependencies and use `depends_on`.
- **CodeSamples: Resource Dependencies**: Examples demonstrating resource dependencies.

Ensure to replace placeholders with valid values (e.g., AMI IDs) and adjust configurations based on your needs.
