# Flask & Express Separate EC2 Deployment with Terraform

This project provisions two separate EC2 instances on AWS using Terraform:
- **Flask Backend** (Python, port 5000)
- **Express Frontend** (Node.js, port 3000)

Each instance is deployed in the same VPC and subnet, with proper security groups and networking. The Express app is configured to communicate with the Flask backend.

---

## Architecture

- **VPC**: Custom VPC with a public subnet
- **Internet Gateway**: For public internet access
- **Route Table**: Routes all outbound traffic to the internet
- **Security Groups**:
  - `flask_sg`: Allows inbound traffic on port 5000 (Flask) and SSH (22)
  - `express_sg`: Allows inbound traffic on port 3000 (Express), port 5000 from Flask SG, and SSH (22)
- **EC2 Instances**:
  - Flask: Runs the backend API
  - Express: Runs the frontend, connects to Flask using Flask's public IP

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- AWS account and credentials configured
- Existing EC2 Key Pair (for SSH access)
- Valid Ubuntu AMI ID for your region

---

## Usage

1. **Clone this repository**

2. **Configure variables**
   - Edit `terraform.tfvars` or set variables via CLI:
     - `aws_region`: AWS region (default: `ap-south-1`)
     - `instance_type`: EC2 instance type (default: `t2.micro`)
     - `key_name`: Your EC2 Key Pair name
     - `ami_id`: Ubuntu AMI ID for your region

3. **Initialize Terraform**
   ```sh
   terraform init
   ```

4. **Plan the deployment**
   ```sh
   terraform plan
   ```

5. **Apply the configuration**
   ```sh
   terraform apply
   ```
   - Confirm with `yes` when prompted.

6. **Outputs**
   - After apply, Terraform will output the public IPs for both Flask and Express instances.

---

## File Structure

```
.
├── main.tf              # Main Terraform configuration
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── terraform.tfvars     # Variable values (user-supplied)
├── user_data/
│   ├── flask.sh         # User data script for Flask EC2
│   └── express.sh       # User data script for Express EC2
```

---

## User Data Scripts

- **user_data/flask.sh**: Installs Python, Flask, Flask-CORS, clones the repo, and starts the backend.
- **user_data/express.sh**: Installs Node.js, clones the repo, updates the frontend to point to the Flask backend, and starts the frontend.

---

## Security
- Only ports 22, 3000, and 5000 are open to the world for demonstration. For production, restrict access as needed.

---

## Destroying the Infrastructure

To tear down all resources:
```sh
terraform destroy
```

---

## License

This project is provided for educational purposes. Use at your own risk.
