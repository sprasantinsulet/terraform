terraform {
  required_version = ">= 1.0"
  
  backend "local" {
    path = "terraform.tfstate"
  }
}

# Simple local file resource for testing
resource "local_file" "test_file" {
  filename = "test-output.txt"
  content  = "This is a test file created by Terraform at ${timestamp()}"
}

# Output the file path
output "test_file_path" {
  value = local_file.test_file.filename
}
