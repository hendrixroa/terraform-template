resource "null_resource" "docker_packaging" {

  provisioner "local-exec" {
    command = <<EOF
    aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-1.amazonaws.com
    gradle build -p noiselesstech
    docker build -t "${aws_ecr_repository.noiselesstech.repository_url}:latest" -f noiselesstech/Dockerfile .
    docker push "${aws_ecr_repository.noiselesstech.repository_url}:latest"
    EOF
  }

  triggers = {
    "run_at" = timestamp()
  }

  depends_on = [
    aws_ecr_repository.noiselesstech,
  ]
}