# Terraform and Ansible for Moodle Deployment on AWS

This repository contains Terraform and Ansible configurations for deploying a Moodle server on AWS. Follow the instructions below to set up the environment and deploy Moodle.

## Prerequisites

1. **AWS Credentials**: Ensure you have AWS credentials configured on your machine. You can set them up using the AWS CLI:
   ```sh
   aws configure
   ```

2. **SSH Key Pair**: Create an SSH key pair to access the EC2 instance. You can create one using the AWS Management Console or the AWS CLI:
   ```sh
   aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
   chmod 400 MyKeyPair.pem
   ```

3. **Terraform**: Install Terraform on your machine. Follow the instructions on the [Terraform website](https://www.terraform.io/downloads.html).

4. **Ansible**: Install Ansible on your machine. You can install it using pip:
   ```sh
   pip install ansible
   ```

## Terraform Configuration

The `main.tf` file contains the Terraform configuration for deploying an EC2 instance on AWS.

### Steps to Deploy

1. Initialize Terraform:
   ```sh
   terraform init
   ```

2. Apply the Terraform configuration:
   ```sh
   terraform apply
   ```

3. Note the public IP address of the created EC2 instance from the Terraform output.

## Ansible Playbook

The `moodle_setup.yml` file contains the Ansible playbook for setting up the Moodle server on the EC2 instance.

### Steps to Run the Playbook

1. Update the `moodle_setup.yml` file with the correct path to your local Moodle files:
   ```yaml
   vars:
     moodle_local_path: "/path/to/local/moodle"
     moodle_remote_path: "/var/www/html/moodle"
   ```

2. Run the Ansible playbook:
   ```sh
   ansible-playbook -i <EC2_PUBLIC_IP>, -u ubuntu --private-key MyKeyPair.pem moodle_setup.yml
   ```

## Security Best Practices

- **IAM Roles**: Use IAM roles for the EC2 instance to manage permissions securely.
- **Security Groups**: Ensure the security group allows only necessary traffic (HTTP on port 80 and SSH on port 22).
- **SSH Key Management**: Keep your SSH private key secure and do not share it.

## Conclusion

By following the above instructions, you can deploy a Moodle server on AWS using Terraform and Ansible. Ensure you follow security best practices to keep your environment secure.
