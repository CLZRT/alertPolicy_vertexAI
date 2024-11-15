terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.51.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

resource "google_monitoring_notification_channel" "basic" {
  display_name = "Test Notification Channel"
  type         = "email"
  labels = {
    email_address = var.email
  }
  force_delete = false
}

resource "google_monitoring_alert_policy" "alert_gemini_input_usage" {
  display_name = "Gemini Input Usage Alert"
  combiner     = "OR"
  conditions {
    display_name = "Gemini 1 hour token usage condition"
    condition_prometheus_query_language {
      query      = "sum(increase(aiplatform_googleapis_com:quota_generate_content_input_tokens_per_minute_per_base_model_usage[1h])) > ${var.token_threshold}"
      duration   = "60s"
      evaluation_interval = "60s"
      alert_rule  = "AlwaysOn"
      rule_group  = "a test"
	 
    }
  }
 
  notification_channels = [
	google_monitoring_notification_channel.basic.id]
  alert_strategy {
    auto_close  = "1800s"
  }
}

resource "google_monitoring_alert_policy" "alert_gemini_output_usage" {
  display_name = "Gemini Output Usage Alert"
  combiner     = "OR"
   conditions {
    display_name = "Gemini 1 hour request usage condition"
    condition_prometheus_query_language {
      query      = "sum(increase(aiplatform_googleapis_com:quota_generate_content_requests_per_minute_per_project_per_base_model_usage[1h])) > ${var.request_threshold}"
      duration   = "60s"
      evaluation_interval = "60s"
      alert_rule  = "AlwaysOn"
      rule_group  = "a test"
	 
    }
  }
 
  notification_channels = [
	google_monitoring_notification_channel.basic.id]
  alert_strategy {
    auto_close  = "1800s"
  }
}


resource "google_monitoring_alert_policy" "alert_claude3_input_usage" {
  display_name = "Claude3 Usage Alert"
  combiner     = "OR"
  conditions {
    display_name = "Claude3 1 hour token usage condition"
    condition_prometheus_query_language {
      query      = "sum(increase(aiplatform_googleapis_com:quota_online_prediction_tokens_per_minute_per_base_model_usage[1h])) > ${var.token_threshold}"
      duration   = "60s"
      evaluation_interval = "60s"
      alert_rule  = "AlwaysOn"
      rule_group  = "a test"
	 
    }
  }
 
  notification_channels = [
	google_monitoring_notification_channel.basic.id]
  alert_strategy {
    auto_close  = "1800s"
  }
}

resource "google_monitoring_alert_policy" "alert_claude3_output_usage" {
  display_name = "Claude3 Output Usage Alert"
  combiner     = "OR"
  conditions {
    display_name = "Claude3 1 hour request usage condition"
    condition_prometheus_query_language {
      query      = "sum(increase(aiplatform_googleapis_com:quota_online_prediction_requests_per_base_model_usage[1h])) > ${var.request_threshold}"
      duration   = "60s"
      evaluation_interval = "60s"
      alert_rule  = "AlwaysOn"
      rule_group  = "a test"
	 
    }
  }
 
  notification_channels = [
	google_monitoring_notification_channel.basic.id]
  alert_strategy {
    auto_close  = "1800s"
  }
}