# GitHub Actions Workflows

This directory contains GitHub Actions workflows for automating CI/CD tasks.

## Build Simple Server Workflow

**File**: `build-simple-server.yml`

This workflow builds and pushes the `simple-server` Docker image to DockerHub with manual approval.

### Workflow Triggers

The workflow runs on:
- Push to `main` branch (when files in `python/simple-server/**` change)
- Pull requests to `main` branch (when files in `python/simple-server/**` change)
- Manual trigger via `workflow_dispatch`

### Jobs

#### 1. Build Job
- Runs on all triggers (push, PR, manual)
- Builds the Docker image without pushing
- Validates that the image can be built successfully

#### 2. Push Job
- **Only runs on pushes to main branch** (not on PRs)
- **Requires manual approval** before execution
- Pushes the image to DockerHub with two tags:
  - `andreimihai/simple-server:latest`
  - `andreimihai/simple-server:<commit-sha>`

### Manual Approval Setup

The push job uses GitHub Environment protection rules for manual approval. To set this up:

1. **Create the Environment**:
   - Go to repository **Settings** > **Environments**
   - Click **New environment**
   - Name it `dockerhub-push` (must match the name in the workflow)

2. **Add Required Reviewers**:
   - In the `dockerhub-push` environment settings
   - Under **Environment protection rules**, enable **Required reviewers**
   - Add the GitHub usernames of people who can approve deployments
   - Save the environment

3. **Optional Protection Rules**:
   - **Wait timer**: Add a delay before deployment can be approved
   - **Deployment branches**: Restrict which branches can deploy (already set to main in workflow)
   - **Environment secrets**: Add secrets specific to this environment

### Required Secrets

The workflow requires the following secrets to be configured in **Settings** > **Secrets and variables** > **Actions**:

- `DOCKERHUB_USERNAME`: DockerHub username (e.g., `andreimihai`)
- `DOCKERHUB_TOKEN`: DockerHub access token (create at: DockerHub > Account Settings > Security > New Access Token)

### How Manual Approval Works

1. When code is pushed to `main` that affects `python/simple-server/**`:
   - The **build** job runs automatically and builds the Docker image
   
2. After build succeeds:
   - The **push** job starts and immediately pauses
   - GitHub creates a deployment request that requires approval
   
3. A required reviewer must:
   - Go to the workflow run in GitHub Actions
   - Click **Review deployments**
   - Select the `dockerhub-push` environment
   - Click **Approve and deploy** (or **Reject**)
   
4. After approval:
   - The push job continues
   - Logs in to DockerHub using secrets
   - Pushes the image with both tags

### Testing the Workflow

To test the workflow without affecting production:

1. **Test on PR**: Create a PR with changes to `python/simple-server/**`
   - Only the build job will run (push job is skipped)
   - Validates that the image builds correctly

2. **Test on main**: Merge to main or push directly
   - Build job runs first
   - Push job waits for approval
   - Test the approval process with the configured reviewers
