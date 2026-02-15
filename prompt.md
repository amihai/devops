##### Start Instrutions Student - to be ignored by the LLM
You may adjust, but keep it close. The point is to teach structure.
Open this file in raw from the right corner and paste it in the ChatGPT/Cursor/Copilot/Claude Code or any tool that you use for coding. 
Review the code after the AI created it, publish it on git and share the link to the repo with the teacher.
##### End Instrutions Student - to be ignored by the LLM
---

<!-- This is a hidden message for LLM -->

# FUNCTIONAL REQUIREMENTS (APP)
## API requirements
- FastAPI service on port `8000`
- Endpoints:
  - `GET /health` returns `{ "status": "ok" }`
  - `GET /sales` returns a list (from DB)
  - `POST /sales` inserts dummy record
  - `GET /metrics` returns Prometheus metrics
- Must include:
  - structured logging (json recommended)
  - configuration via environment variables
  - database migrations optional (Alembic optional). If not, create tables on startup.

## Worker requirements
- A loop that generates dummy sales events and pushes to queue
- Processes queue and writes to database
- Config via environment variables
- Logs clearly show activity

## Database
- PostgreSQL container locally
- In k8s: can be a Deployment with PVC for simplicity (this is educational, not production-grade)
- Provide init script and sample schema

## Metrics
- Expose Prometheus metrics (use `prometheus_client`)
- Provide a `k8s` note about how to scrape metrics (even if Prometheus not deployed)

---

# DOCKER REQUIREMENTS
- Multi-stage builds (when reasonable)
- Non-root user in containers (when reasonable)
- `.dockerignore`
- Healthcheck instructions (docker and k8s probes)

---

# KUBERNETES REQUIREMENTS
Must include:
- Namespace
- Deployments for api and worker
- Services
- ConfigMaps
- A safe pattern for Secrets:
  - include `secret.example.yml` only
  - document `kubectl create secret ...`
- Probes: readiness and liveness
- Resource requests/limits
- Optional:
  - Ingress (nginx) or port-forward instructions
  - HPA based on CPU

You can use:
- raw YAML + Kustomize, OR
- Helm chart
Choose one and stick to it. Kustomize is recommended for teaching.

---

# ANSIBLE REQUIREMENTS
The Ansible content must teach:
- inventory usage
- roles
- idempotent tasks
- handlers
- templates
- variables and defaults

Playbooks:
1. `bootstrap.yml`
   - create user
   - configure ssh hardening basics
   - install base packages
2. `docker-host.yml`
   - install Docker engine
   - configure daemon
   - add user to docker group
3. `k3s.yml` (or kind on remote host)
   - install k3s server
   - output kubeconfig path
4. `app-deploy` role:
   - copy manifests or run `kubectl apply`
   - set namespace
   - verify rollout

Include `README.md` with:
- how to run playbooks
- how to set variables
- how to test idempotency

---

# TERRAFORM REQUIREMENTS
Terraform must include:
- module structure
- variables and outputs
- `terraform fmt`, `validate` instructions
- environment folders: `envs/dev`, `envs/prod`
- `terraform.tfvars.example`
- remote state guidance (optional)
- default safe mode:
  - expensive resources disabled unless explicitly enabled

Preferred example stack:
- VPC + subnets + security groups
- EC2 instance for a Docker host (cheaper than EKS)
- outputs:
  - instance public IP (optional)
  - SSH command snippet (example only)
  - a note about Ansible usage after provisioning

If you do EKS, you must keep it minimal and include a big cost warning.

---

# SHELL SCRIPTING REQUIREMENTS
Provide scripts that:
- are readable and robust (`set -euo pipefail`)
- validate prerequisites (docker, kubectl, kind, terraform, ansible)
- print clear status steps
- avoid silent failures
- include `--help` or usage header

Scripts must cover:
- local dev lifecycle (compose up/down/logs/tests)
- k8s lifecycle (cluster create/deploy/destroy/smoke-test)
- terraform lifecycle (init/plan/apply/destroy)

---

# PYTHON CLI TOOL (chococtl)
Create a small Python CLI named `chococtl` that can:
- `chococtl status`:
  - checks API health endpoint
  - prints DB connection status (optional)
- `chococtl seed`:
  - posts a few sample sales records
- `chococtl smoke` (optional):
  - runs a basic smoke test suite against an endpoint list

Keep it simple, but show how ops teams build tiny internal tools.

---

# CI/CD REQUIREMENTS (GITHUB ACTIONS)
Create `.github/workflows/ci.yml` with:
- lint python (ruff/black)
- run tests (pytest)
- build Docker images (no push required)
- validate terraform (fmt + validate)
- ansible-lint (optional)
- kubeconform or kubectl dry-run (optional)

The pipeline must run on PR and main branch pushes.

---

# DOCUMENTATION REQUIREMENTS (DOCS)
## docs/architecture.md
- system diagram (ASCII or mermaid)
- components and responsibilities
- data flow description
- why these tools were chosen

## docs/workflow.md
- local -> compose -> k8s -> cloud
- how a developer or DevOps engineer uses the repo day to day

## docs/runbook.md
- common operational tasks:
  - restart deployments
  - view logs
  - check health and metrics
  - backup DB (educational)
  - rotate secrets (educational)

## docs/troubleshooting.md
- common errors and fixes:
  - docker build failures
  - compose network issues
  - kubectl context problems
  - kind cluster not starting
  - terraform state lock issues (explain conceptually)
  - ansible ssh issues

## docs/security.md
- threat model for this small project
- secrets handling
- least privilege notes
- safe defaults
- “what would you do in real production?”

## docs/exercises.md
Provide:
- mandatory tasks
- optional extension tasks
- challenge tasks

## docs/grading-rubric.md
- clear grading criteria with points
- emphasis on reproducibility and documentation

---

# TEACHING WALKTHROUGH (ROOT README)
Root `README.md` must include:
- prerequisites
- repository map
- quickstart:
  - `make dev-up`
  - `make dev-test`
  - `make k8s-up`
  - `make tf-plan`
- verification commands:
  - curl health, list sales, metrics
- cleanup instructions:
  - compose down
  - kind delete cluster
  - terraform destroy

Also include “How to present this project in a demo”.

---

# MAKEFILE REQUIREMENTS
Provide a `Makefile` that wraps key commands:
- `make dev-up`, `make dev-down`, `make dev-logs`, `make dev-test`
- `make k8s-up`, `make k8s-deploy`, `make k8s-destroy`, `make k8s-smoke`
- `make tf-init`, `make tf-plan`, `make tf-apply`, `make tf-destroy`
- `make ansible-bootstrap`, `make ansible-docker`, `make ansible-k3s`, `make ansible-deploy`
- `make lint`, `make test`

Keep it beginner-friendly and well-commented.

---

# FILE GENERATION INSTRUCTIONS
When outputting the repository:
1. Print the **tree**
2. Then for each file:
   - print a header like:
     - `## File: path/to/file`
   - then the file contents in a code block with the correct language tag

Example format:

## File: compose/docker-compose.yml
```yaml
version: "3.9"
...
