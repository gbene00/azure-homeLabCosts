output "subscription_id" {
  description = "The subscription ID used for this deployment."
  value       = data.azurerm_subscription.current.id
}

output "budget_id" {
  description = "ID of the monthly subscription budget."
  value       = azurerm_consumption_budget_subscription.monthly_budget.id
}

output "cost_view_id" {
  description = "ID of the Cost Management view used for the monthly email."
  value       = azurerm_subscription_cost_management_view.monthly_view.id
}

output "scheduled_action_id" {
  description = "ID of the Cost Management scheduled action (monthly email)."
  value       = azurerm_cost_management_scheduled_action.monthly_email.id
}