## AWS Infrastructure Overview with Network Setup

The **hokify-technical-challenge** project utilizes a comprehensive AWS infrastructure with a well-defined network setup to ensure secure and efficient operation of the Node.js server. The infrastructure components and network configuration include:

- **Amazon VPC (Virtual Private Cloud)**: Provides an isolated virtual network environment where the ECS Fargate tasks and other resources are deployed. It enables complete control over the virtual networking environment, including IP address range selection, subnet creation, and route table configuration.


- **Subnets**: Within the VPC, multiple subnets are configured across different Availability Zones (AZs) to enhance fault tolerance and high availability. These subnets are used for deploying the ECS Fargate tasks and associated resources.


- **Security Groups**: Attached to the ECS tasks and ALB, security groups act as virtual firewalls to control inbound and outbound traffic, ensuring that only necessary and secure communication is allowed.
- Inbound traffic: enabled only 8080 and 80 port.


- **Amazon ECS (Elastic Container Service)**: Manages and orchestrates Docker containers within the VPC, leveraging the Fargate launch type for serverless compute capabilities.


- **Container Name**: `hokify-container`
- **Image**: The ECR image URL
- **Memory**: 512 MB
- **CPU**: 256 units
- **Port Mapping**: Exposes port 8080
- **Logging Configuration**: Sends logs to CloudWatch Logs


- **AWS Fargate**: Offers serverless compute for containers, allowing the application to run without the need to manage the underlying infrastructure. Fargate tasks are deployed within the VPC subnets to ensure network isolation and security.


- **Amazon ECR (Elastic Container Registry)**: Hosts the Docker images of the application within the VPC, allowing for secure storage, distribution, and access control of container images.


- **Application Load Balancer (ALB)**: Positioned within the public subnets, the ALB routes incoming HTTP/HTTPS traffic to the appropriate ECS tasks deployed across private subnets, enhancing the application's availability, scalability, and fault tolerance.
- 
- **ALB Name**: hokify lb
- **Address**: [http://hokify-lb-184354042.us-east-2.elb.amazonaws.com/](http://hokify-lb-184354042.us-east-2.elb.amazonaws.com/)
- **Listen Port**: 80
- **Target Group**: ecs-hokify-hokify-service1
- **ECS Service Name**: hokify-service


- **Amazon CloudWatch**: Monitors and logs the application's performance, health, and network traffic patterns, providing insights into resource utilization, application metrics, and network activity.
