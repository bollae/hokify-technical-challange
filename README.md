# hokify-technical-challenge

## Overview

The **hokify-technical-challenge** project is a simple Node.js server that is deployed using Docker on an AWS ECS cluster, utilizing Fargate. It provides a basic API endpoint that responds with the message "hello hokify" when accessed.

## Project Structure

### Node.js File (`nodejs.ts`)

The main Node.js file (`nodejs.ts`) sets up an Express server. It listens on a specified port (either from the environment variable or defaulting to 8080) and responds with the message "hello hokify" when accessed via the root route (`/`).

### `package.json`

The `package.json` file contains metadata about the project, including its name, version, description, and dependencies. Key scripts include:

- `start`: Runs the server using `node nodejs.ts`.
- `lint`: Lints the code using ESLint.
- `prettier`: Formats the code using Prettier.

### Dockerfile

The `Dockerfile` defines the Docker image for the project. It starts from the official Node.js image, sets the working directory, installs dependencies, and exposes port 8080. The `CMD` instruction specifies how to start the server.

### GitHub Action Pipeline (`deploy.yml`)

The GitHub Actions pipeline automates the deployment process for your Node.js server. It ensures that your code is built, tested, and deployed consistently whenever changes are pushed to the `main` branch.

#### Workflow File: `.github/workflows/deploy.yml`

This workflow file defines the steps to be executed during the deployment process:

1. **Event Trigger**:
   - The pipeline is triggered on every push to the `main` branch.
   - You can customize this trigger based on your requirements (e.g., pull requests, tags, etc.).

2. **Permissions**:
   - The pipeline specifies permissions for accessing secrets (like AWS credentials).
   - In this case, it requires write access to the repository and read access to its contents.

3. **Jobs**:
   - The `deploy` job runs on an Ubuntu runner.
   - Steps within this job are executed sequentially.

4. **Steps**:
   - **Checkout code**:
     - This step fetches the latest code from the repository.
   - **Configure AWS credentials**:
     - Sets up AWS credentials using secrets stored in your repository.
   - **Login to Amazon ECR**:
     - Authenticates with Amazon Elastic Container Registry (ECR) to push Docker images.
   - **Build, tag, and push image to Amazon ECR**:
     - Builds the Docker image from your code.
     - Tags the image with the latest commit SHA.
     - Pushes the image to your ECR repository.
   - **Deploy to Amazon ECS**:
     - Deploys the new image to Amazon Elastic Container Service (ECS).
     - Uses the specified task definition (`hokify-task.json`).
     - Ensures service stability before completing the deployment.

### AWS ECS Task Definition (`hokify-task.json`)

The ECS task definition describes how your container should run within the ECS cluster. Key details include:

- **Container Name**: `hokify-container`
- **Image**: The ECR image URL
- **Memory**: 512 MB
- **CPU**: 256 units
- **Port Mapping**: Exposes port 8080
- **Logging Configuration**: Sends logs to CloudWatch Logs

## Deployment Process

1. Push changes to the `main` branch.
2. GitHub Actions triggers the pipeline.
3. The Docker image is built, tagged, and pushed to ECR.
4. ECS deploys the new image to your service.

Remember to replace placeholders (like AWS credentials) with actual values in your workflow file.

## Author

- **Eszter Bolla**

---

Feel free to expand this documentation with additional details, instructions, or usage guidelines as needed. 🚀📝
