resource "aws_ecr_repository" "noiselesstech" {
  name = "noiselesstech"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "default_policy" {
  repository = aws_ecr_repository.noiselesstech.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep only the last ${var.untagged_images} untagged images.",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": ${var.untagged_images}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF

}