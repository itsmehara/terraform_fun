output "aws_instance_id" {
  value = aws_instance.aws_example.id
}

output "google_instance_id" {
  value = google_compute_instance.google_example.id
}
