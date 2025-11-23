# Budget basics variables
variable "budget_name" {
  description = "Name of the subscription budget."
  type        = string
  default     = "monthly-consumption-budget"
}

variable "budget_amount" {
  description = "Monthly budget amount in subscription currency"
  type        = number
  default     = 100
}

variable "budget_time_grain" {
  description = "Time grain for the budget."
  type        = string
  default     = "Monthly"
}

variable "budget_start_date" {
  description = "Start date for the budget."
  type        = string
  default     = "2025-12-01T00:00:00Z"
}

variable "budget_end_date" {
  description = "End date for the budget."
  type        = string
  default     = "2030-01-01T00:00:00Z"
}

variable "budget_contact_emails" {
  description = "Email addresses to notify for budget alerts."
  type        = list(string)
  default = [
    "bene.gabriel3@gmail.com",
  ]
}

# Shared operator + type for all thresholds
variable "budget_notification_operator" {
  description = "Comparison operator for budget notifications."
  type        = string
  default     = "EqualTo"
}

variable "budget_notification_type" {
  description = "Threshold type for budget notifications."
  type        = string
  default     = "Actual"
}

#Tresholds list
variable "budget_notifications" {
  description = "List of percentages for budget notifications."
  type        = list(number)
  default     = [30.0, 50.0, 80.0, 100.0]
}


# Cost view variables
variable "cost_view_name" {
  description = "Internal name of the Cost Management view."
  type        = string
  default     = "monthly-subscription-cost"
}

variable "cost_view_display_name" {
  description = "Display name of the Cost Management view."
  type        = string
  default     = "Monthly Subscription Cost"
}

variable "cost_view_chart_type" {
  description = "Chart type for the cost view."
  type        = string
  default     = "StackedColumn"
}

variable "cost_view_accumulated" {
  description = "Whether the cost view should show accumulated costs."
  type        = bool
  default     = false
}

variable "cost_view_report_type" {
  description = "Cost Management report type."
  type        = string
  default     = "Usage"
}

variable "cost_view_timeframe" {
  description = "Timeframe for the cost view."
  type        = string
  default     = "MonthToDate"
}

variable "cost_view_granularity" {
  description = "Granularity for the dataset."
  type        = string
  default     = "Monthly"
}


# Scheduled action (email) variables
variable "scheduled_action_name" {
  description = "Name of the scheduled action."
  type        = string
  default     = "monthly-cost-email"
}

variable "scheduled_action_display_name" {
  description = "Display name of the scheduled action."
  type        = string
  default     = "[Monthly] Subscription cost email"
}

variable "scheduled_action_frequency" {
  description = "Frequency of the scheduled action."
  type        = string
  default     = "Monthly"
}

variable "scheduled_action_start_date" {
  description = "Start date for the scheduled action."
  type        = string
  default     = "2025-01-01T00:00:00Z"
}

variable "scheduled_action_end_date" {
  description = "End date for the scheduled action."
  type        = string
  default     = "2030-01-01T00:00:00Z"
}

variable "scheduled_action_hour_of_day" {
  description = "Hour of day when the scheduled action runs."
  type        = number
  default     = 9
}

variable "scheduled_action_day_of_month" {
  description = "Day of month when the scheduled action runs."
  type        = number
  default     = 30
}

variable "scheduled_action_email_sender" {
  description = "Logical 'from' address shown in the scheduled email."
  type        = string
  default     = "no-reply@contoso.local"
}

variable "scheduled_action_email_recipients" {
  description = "Recipients of the scheduled cost email."
  type        = list(string)
  default = [
    "bene.gabriel3@gmail.com",
  ]
}