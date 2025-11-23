# Subscription info
data "azurerm_subscription" "current" {}

# -------------------------
# Monthly Budget for Subscription Threshold Notifications
# -------------------------
resource "azurerm_consumption_budget_subscription" "monthly_budget" {
  name            = var.budget_name
  subscription_id = data.azurerm_subscription.current.id

  amount     = var.budget_amount
  time_grain = var.budget_time_grain

  time_period {
    start_date = var.budget_start_date
    end_date   = var.budget_end_date
  }

  # Dynamic notifications from list of thresholds
  dynamic "notification" {
    for_each = var.budget_notifications

    content {
      enabled        = true
      operator       = var.budget_notification_operator
      threshold      = notification.value
      threshold_type = var.budget_notification_type
      contact_emails = var.budget_contact_emails
    }
  }
}

# -------------------------
# Cost view for your subscription
# -------------------------
resource "azurerm_subscription_cost_management_view" "monthly_view" {
  name         = var.cost_view_name
  display_name = var.cost_view_display_name
  chart_type   = var.cost_view_chart_type
  accumulated  = var.cost_view_accumulated

  subscription_id = data.azurerm_subscription.current.id

  report_type = var.cost_view_report_type
  timeframe   = var.cost_view_timeframe

  dataset {
    granularity = var.cost_view_granularity

    aggregation {
      name        = "totalCost"
      column_name = "Cost"
    }
  }
}

# -------------------------
# Scheduled email on the Nth of every month at configurable hour
# -------------------------
resource "azurerm_cost_management_scheduled_action" "monthly_email" {
  name         = var.scheduled_action_name
  display_name = var.scheduled_action_display_name

  view_id = azurerm_subscription_cost_management_view.monthly_view.id

  frequency    = var.scheduled_action_frequency
  start_date   = var.scheduled_action_start_date
  end_date     = var.scheduled_action_end_date
  hour_of_day  = var.scheduled_action_hour_of_day
  day_of_month = var.scheduled_action_day_of_month

  email_address_sender = var.scheduled_action_email_sender
  email_addresses      = var.scheduled_action_email_recipients
  email_subject = "Monthly Azure subscription cost"
  message       = "Please see this month's Azure subscription cost."
}