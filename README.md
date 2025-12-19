#  **Azure Home Lab Costs — Cost Management Solution for Azure Subscriptions**

##  **Overview**

This repository contains a Terraform-based infrastructure-as-code solution designed to implement cost management and budget alerts for Azure subscriptions. It automates the provisioning of Azure Cost Management constructs—primarily Azure Budgets with multiple thresholds and email alerting—to help proactively monitor and control spending in cloud environments.

**Key Features**

### **Terraform-driven provisioning**
Uses Terraform configuration files (*.tf) to define, deploy, and manage Azure resources in a repeatable and version-controlled way.

### **Azure Budget Alerts**
Configures an Azure Budget with four configurable thresholds. When each threshold is hit (50%, 75%, 90%, 100% of budget), notification emails are sent to the subscription owner to help enforce cost discipline before overages occur.

### **Email notifications**
Integrated alerting mechanism to notify owners when spending levels reach defined limits, improving visibility and enabling proactive cost action.

### **Configurable parameters**
Budget limits, email recipients, thresholds, and target scopes are parameterized via Terraform variables allowing the solution to be adapted easily across different subscriptions or environments.


## **Technical Stack**

- Terraform (HCL) — Infrastructure definitions for Azure resources.
- Azure Resource Manager / Azure Cost Management APIs (implied by Terraform providers).
- Email alerting through Azure Budget notifications (leveraging Azure’s built-in alert mechanisms).

## **Repository Sturecture**

 - _main.tf_
  The core entry point of the Terraform configuration, responsible for:
    - Defining the Azure Cost Management Budget at subscription scope
    - onfiguring multiple budget thresholds
    - Attaching email notifications to each threshold
    - Orchestrating all cost-governance resources in one place

 - _variables.tf_
  Centralized definition of input variables used to customize the deployment, such as:
    - Budget amount and currency
    - Notification thresholds (percentage-based)
    - Email recipients / subscription owner contact
    - Target subscription or scope

 - _providers.tf_
  Configures the required Terraform providers, primarily:
    - azurerm — used to interact with Azure Cost Management and subscription-level resources
    - Provider features and version constraints to ensure consistent deployments

 - _outputs.tf_
  Exposes relevant values after terraform apply, such as:
    - Budget name or ID
    - Confirmation of configured thresholds
    - Any identifiers useful for validation or future integrations
