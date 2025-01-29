# Sports API Management System


## 🚀 Project Overview

![Untitled Diagram drawio](https://github.com/user-attachments/assets/df58daa1-9177-43b1-bdbd-315be9886d59)

Welcome to DevOpsChallenge #4! This project creates a containerized API management system for querying real-time sports data. It utilizes Amazon ECS (Fargate) for container orchestration, Amazon API Gateway to expose RESTful endpoints, and integrates with an external Sports API. The goal is to develop a scalable, serverless, and secure solution for managing sports data.

During my initial attempt at building the system, I manually configured everything through the AWS console, and it worked as expected. However, to challenge myself and enhance efficiency, flexibility, and speed, I automated the entire process using Terraform (Infrastructure as Code, IAC). This project posed a few challenges, especially during deployment, but I gained valuable insights and hands-on experience from it.

## 🏆 What This Project Does
✅ **Fetches Sports Data**: Retrieves real-time sports data from the **SerpAPI**.
✅ **Containerized Backend**: Runs a **Flask API** inside a Docker container.
✅ **Deploys to AWS ECS (Fargate)**: Ensures a fully managed, serverless infrastructure.
✅ **Exposes REST API**: Uses **API Gateway** to provide a secure endpoint.
✅ **Monitors with CloudWatch**: Tracks API activity and logs errors.


## 🛠️ Tools & Technologies
- **Programming Language**: Python 3.x
- **Cloud Provider**: AWS
- **Core AWS Services**: ECR, ECS (Fargate), API Gateway, CloudWatch
- **Containerization**: Docker
- **Infrastructure as Code**: Terraform
- **Security**: IAM roles and security groups


## 🔧 Prerequisites
### Before you start, make sure you have:
- **AWS Account**: Sign up if you don’t have one.
- **AWS CLI Installed**: Configure AWS CLI with valid credentials.
- **Terraform Installed**: Used for provisioning AWS infrastructure.
- **SerpAPI Key**: Obtain an API Key from [SerpAPI](https://serpapi.com/).
- **Docker Installed**: Required for building and running containers.


## 🏗️ How It Works
### 1️⃣ Clone the Repository
```bash
git clone https://github.com/kingdave4/Containerized-Sports-Api.git
cd containerized-sports-api
```

### 1️⃣ Create ECR Repo
```bash
aws ecr create-repository --repository-name sports-api --region us-east-1
```

### 3️⃣ Authenticate, Build, and Push the Docker Image
```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com

docker build --platform linux/amd64 -t sports-api .
docker tag sports-api:latest <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/sports-api:sports-api-latest
docker push <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/sports-api:sports-api-latest
```


### 4️⃣ Deploy Infrastructure Using Terraform
```bash
cd terraform
terraform init
terraform plan -var="sports_api_key=<Enter your SerpAPI key>" 
terraform apply -var="sports_api_key=<Enter your SerpAPI key>" -auto-approve
```

### 5️⃣ Retrieve API Gateway Endpoint
Once deployment is complete, Terraform will output the **API Gateway URL**. Use this to test the API:

![image](https://github.com/user-attachments/assets/233febc6-dbd6-46eb-ab3a-44232417b65b)



## 📂 Project Structure
```
sports-api-management/
├── app.py                  # Flask application for querying sports data
├── Dockerfile              # Dockerfile to containerize the Flask app
├── requirements.txt        # Python dependencies
├── terraform/              # Terraform configuration files
├── .dockerignore           # Docker ignore file
├── .gitignore              # Git ignore file
└── README.md               # Project documentation
```

## ⚙️ AWS Services Breakdown
✅ **ECR Reposiory**: Stores the docker image in the cloud.
✅ **ECS Cluster**: Runs the containerized Flask application.
✅ **ECS Task Definition**: Defines CPU, memory, and environment settings.
✅ **ECS Service**: Ensures the Flask API runs consistently.
✅ **Application Load Balancer**: Routes traffic securely.
✅ **API Gateway**: Exposes the API to external consumers.
✅ **CloudWatch Logs**: Captures API logs for debugging and monitoring.
✅ **IAM Roles**: Implements least-privilege access control.
✅ **Security Groups**: Enforces secure network communication.

## 🎯 What I Learned
⭐ **Automated AWS infrastructure provisioning** using Terraform.
⭐ **Containerized application deployment** on ECS (Fargate).
⭐ **API Gateway integration** for secure API access.
⭐ **CloudWatch monitoring** to track API activity and errors.

## Clean up time
To be able to delete all the resouces that was created by Terraform use the following command.
```bash
terraform destroy -var="sports_api_key=<Enter your SerpAPI key>" -auto-approve
```

## 🚀 Future Enhancements
🔹 **Add Caching**: Use Amazon ElastiCache for frequent requests.
🔹 **Implement DynamoDB**: Store user-specific API queries.
🔹 **Secure API Gateway**: Use API Keys or IAM authentication.
🔹 **CI/CD Pipelines**: Automate deployment using GitHub Actions.

## 🤝 Contributing
Got ideas? Feel free to **open an issue** or **submit a pull request**!

---
### 📢 **Author**
- GitHub: [kingdave4](https://github.com/kingdave4)

