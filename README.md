# AWS Elastic Beanstalk Terraform Project

This project is designed to deploy an application to AWS Elastic Beanstalk using Terraform. It includes the necessary configuration files and application code to get started.

## Project Structure

```
aws-eb-terraform-project
├── src
│   └── app
│       └── main.py          # Main application code
├── terraform
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Input variables for Terraform
│   ├── outputs.tf           # Output values for Terraform
│   └── provider.tf          # Provider configuration for Terraform
├── .gitignore                # Git ignore file
└── README.md                 # Project documentation
```

## Setup Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd aws-eb-terraform-project
   ```

2. **Install Terraform:**
   Follow the instructions on the [Terraform website](https://www.terraform.io/downloads.html) to install Terraform.

3. **Configure AWS Credentials:**
   Ensure that your AWS credentials are configured. You can set them up using the AWS CLI:
   ```
   aws configure
   ```

4. **Navigate to the Terraform directory:**
   ```
   cd terraform
   ```

5. **Initialize Terraform:**
   Run the following command to initialize the Terraform configuration:
   ```
   terraform init
   ```

6. **Plan the deployment:**
   Generate an execution plan with:
   ```
   terraform plan
   ```

7. **Apply the configuration:**
   Deploy the application using:
   ```
   terraform apply
   ```

8. **Access the application:**
   After the deployment is complete, you can access your application using the URL provided in the output.

## Usage

Modify the `variables.tf` file to customize the application name, environment name, and instance type as needed. After making changes, repeat the `terraform plan` and `terraform apply` steps to update your deployment.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.