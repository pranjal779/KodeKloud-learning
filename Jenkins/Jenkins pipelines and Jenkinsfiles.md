# Jenkins pipelines and Jenkinsfiles

<img width="2015" height="1077" alt="image" src="https://github.com/user-attachments/assets/5d89f640-9f66-4e83-9017-bc3f3c9423e3" />
<img width="1758" height="565" alt="image" src="https://github.com/user-attachments/assets/e7479bc3-1b3b-48f0-b9bf-4d34e3ea406a" />
<img width="1775" height="987" alt="image" src="https://github.com/user-attachments/assets/9fac9df8-8e91-462a-8077-b894157c7f40" />
<img width="2012" height="880" alt="image" src="https://github.com/user-attachments/assets/6791c1a6-713e-4fe6-8efa-b52798e006c2" />
<img width="2026" height="871" alt="image" src="https://github.com/user-attachments/assets/d0106e3b-270a-4672-ac4a-db6bfa4c64b5" />

# Jenkinsfile Notes
- Textbased script written in a Groovy-like domain-specific language (DSL) specifically designed for defining and automating the various stages of your software delivery process.

## 📌 CI/CD Pipeline Stages
- **Source Code Management (SCM)**: Checkout code from version control (Git, Subversion, etc.)
- **Build**: Compile, build, and package the application
- **Test**: Run unit, integration, and other tests to ensure code quality
- **Deploy**: Push built artifacts to staging or production environments

---

## 🛠️ Jenkinsfile Syntax & Components

### 1. Pipeline Definition
- `pipeline { ... }` → Marks the beginning of the pipeline definition

### 2. Agent
- Defines the execution environment for pipeline stages
- Common options:
  - `agent any` → Runs on any available Jenkins agent (including controller)
  - `agent { docker { image 'node:16' } }` → Runs inside a Docker container # Docker build agents

### 3. Stages
- **`stages` (plural)** → Groups all phases of the pipeline
- **`stage('Name')` (singular)** → Defines an individual stage (building block of workflow)
- is the building block that creates distinct phases in your workflows

### 4. Steps
- Inside each stage, `steps { ... }` lists commands/actions
- Examples:
  - Shell commands → `sh 'mvn clean install'`
  - Jenkins DSL commands → `script { ... }`, `when`
  - Third-party plugin integrations → `junit 'testResults/**/*.xml'`

---

## 🧩 Example Breakdown

- **Pipeline agent**: `any` → runs on any available Jenkins agent
- **Build stage**:
  - Executes Maven commands (`mvn clean install`)
  - Runs inside Docker container → `ubuntu:alpine`
  - Agent directive is nested inside `stage('Building')`
  - Only this stage uses the Docker container; others use the root-level `any` agent
- **Test stage**:
  - Runs unit tests
  - Uses JUnit plugin integration
- **Deploy stage (optional)**:
  - Copies built WAR file to production server via `scp`
  - Conditional execution → only runs if branch = `main`
  - Controlled with `when` directive

---

## ✅ Key Takeaways
- **pipeline** → root definition
- **agent** → execution environment (global or stage-specific)
- **stages** → overall pipeline phases
- **stage** → individual phase definition
- **steps** → actual commands/actions inside a stage
- **Agents** can be overridden per stage (e.g., Docker for build, default for others)
- Conditional logic (`when`) allows selective stage execution


# Jenkins Directives
<img width="2057" height="1193" alt="image" src="https://github.com/user-attachments/assets/449b16fe-eda3-47a1-b842-fe607060c394" />
<img width="2027" height="1058" alt="image" src="https://github.com/user-attachments/assets/6fa1b628-66da-4982-bad6-052f52f05fd3" />
<img width="2017" height="1012" alt="image" src="https://github.com/user-attachments/assets/8b43d622-1200-4cc7-af81-ab89d9d996f8" />
<img width="2027" height="1035" alt="image" src="https://github.com/user-attachments/assets/405e722b-0b0d-4b7b-81ec-15064f15607c" />
<img width="1952" height="1007" alt="image" src="https://github.com/user-attachments/assets/a702b8b4-241d-4024-ade1-18919d41182e" />
<img width="2007" height="1013" alt="image" src="https://github.com/user-attachments/assets/3c916e82-0637-452d-b2e5-bccebe8bff33" />
