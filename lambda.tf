module "lambda_noiselesstech" {
  source               = "../terraform-aws-lambda" // A public registry path is allowed too

  code_location        = "./lambdas/example"
  filename             = "example.zip"
  lambda_function_name = "NoiselesstechExample"
  lambda_runtime       = "nodejs14.x"
  layer_arn            = module.layer.arn

  environment_variables = {
    secret = "super secret value"
  }
}

resource "aws_lambda_invocation" "lambda_invocation" {
  function_name = "NoiselesstechExample"

  input = jsonencode({
    hello = "world"
    data = "my super data"
    goodbye = "see you"
  })

  triggers = {
    redeployment = timestamp()
  }

  depends_on = [
    module.lambda_noiselesstech,
  ]
}