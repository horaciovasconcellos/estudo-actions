To identify the type of actions used in a GitHub Actions workflow file, you can follow these steps by looking at the YAML file:

### 1. **Check the `uses` Keyword**:
   - In the workflow file, under the `jobs` section, you’ll find `steps`. Within these `steps`, the `uses` keyword specifies the action being used.
   - Actions can either be:
     - **Pre-built GitHub Actions**: These are reusable actions hosted on GitHub or available through the GitHub Marketplace.
     - **Custom Actions**: These are actions specific to the repository or an organization.

   **Example**:
   ```yaml
   steps:
     - name: Checkout code
       uses: actions/checkout@v2  # Pre-built GitHub action
     - name: Run custom action
       uses: ./custom-action  # Custom action stored locally in the repository
   ```

   - Pre-built actions like `actions/checkout@v2` are identified by their organization and version (e.g., `actions` is the organization, and `checkout@v2` is the action and version).
   - Custom actions are usually local and defined with a relative path like `./custom-action`.

### 2. **Check for `run` Keyword**:
   - When the workflow directly runs shell commands or scripts without using a reusable action, the `run` keyword is used.
   - This is not a specific "action" but a direct command executed in the workflow environment.

   **Example**:
   ```yaml
   steps:
     - name: Run a shell script
       run: |
         echo "Hello, World!"
         ./scripts/deploy.sh
   ```

### 3. **Identify Composite Actions**:
   - Some workflows use **composite actions**, which combine multiple steps into one action. These are defined using multiple `run` or `uses` within the same action definition.
   - They are usually stored in a repository and referenced as a reusable action.

   **Example**:
   ```yaml
   steps:
     - name: Use composite action
       uses: org/composite-action@v1
   ```

### 4. **Look for Reusable Workflows**:
   - You might find references to reusable workflows in other repositories or within the same repository using the `workflow_call` trigger.

   **Example**:
   ```yaml
   uses: org/reusable-workflow/.github/workflows/deploy.yml@main
   ```

### Summary:
- **Pre-built actions**: Identified by `uses: <organization>/<action>@<version>`.
- **Custom actions**: Identified by `uses: ./path-to-action`.
- **Direct commands/scripts**: Identified by `run`.
- **Composite actions and reusable workflows**: Identified by `uses` pointing to another action or workflow in a repository.

By checking the `uses` and `run` keywords, you'll be able to identify the type of action being used in any GitHub Actions workflow file.



```
graph TD
    A[GitHub Actions Workflow File] --> B{`uses` keyword?}
    B -->|Yes| C[Pre-built Actions]
    C --> D[Format: `org/action@version`]
    B -->|Yes| E[Custom Actions]
    E --> F[Format: `./path-to-action`]
    B -->|No| G{`run` keyword?}
    G -->|Yes| H[Direct Commands/Scripts]
    H --> I[Executes shell commands or scripts]
    G -->|No| J[Composite Actions/Reusable Workflows]
    J --> K[Format: `org/repo/.github/workflows/workflow.yml@branch`]
```

```mermaid
  info
```


### In this diagram:

* The first check is whether the uses keyword is present.
* If uses is found, it’s either a Pre-built Action (identified by org/action@version) or a Custom Action (identified by ./path-to-action).
* If uses is not found, the next check is for the run keyword, which identifies Direct Commands/Scripts.
* If neither uses nor run is found, it may be a Composite Action or Reusable Workflow (identified by a reference to another workflow).






```
graph TD
  A[GitHub Actions Workflow File] --> B[Actions]
  A --> C[Commands]
  B --> D[Pre-built Actions]
  B --> E[Custom Actions]

  D --> F[actions/checkout@v2]
  D --> G[actions/setup-node@v3]

  E --> H[Docker Container Action]
  E --> I[Javascript Action]
  E --> J[Composite Action]

  C --> K[run keyword]
  K --> L[Shell commands/scripts]

  H --> M[Dockerfile]
  H --> N[action.yml]

  I --> O[JavaScript Code]
  I --> P[action.yml]

  J --> Q[Multiple Steps]
  J --> R[action.yml]
  
  A --> S[Reusable Workflow]
  S --> T[workflow_call trigger]

```

### Explanation:
1. Actions Workflow File: Represents the overall .yml file where the workflow is defined.
2. Actions: Splits into Pre-built Actions and Custom Actions.
   - Pre-built Actions: Actions from GitHub or third-party repositories (e.g., actions/checkout@v2, actions/setup-node@v3).
   - Custom Actions: Includes Docker Container Actions, JavaScript Actions, and Composite Actions.
      - Docker Container Action: Defined by a Dockerfile and an action.yml file.
      - JavaScript Action: Defined by JavaScript code and an action.yml file.
      - Composite Action: Defined with multiple steps and an action.yml file.
3. Commands: Represented by the run keyword, which directly runs shell commands or scripts.
4. Reusable Workflow: Uses the workflow_call trigger to reference workflows in other repositories or within the same repository.
