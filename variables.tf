variable "project_id" {
	description = "Project ID of the cloud resource"
	type = string
}


variable "email" {
  description = " email for notification"
  type = string
}

variable "token_threshold" {
  description = "The threshold for the input token usage 1 hour"
  type = string
}

variable "request_threshold" {
  description = "The threshold for the output request usage 1 hour"
  type = string
}