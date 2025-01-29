output "api_gateway_url" {
  description = "Sports API Gateway Invoke URL"
  value       = "${aws_api_gateway_deployment.sports_api_deployment.invoke_url}/sports"
}