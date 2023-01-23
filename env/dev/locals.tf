locals {
  region               = "us-east-1"
  env                  = "dev"
  name_suffix          = "test"
  lambda_function_name = "knakano-sls-lambdaedge-project-dev-hello"
  iam_role_name        = "knakano_iam_for_lambda_test_role"
  cloudfront_oac_name  = "knakano-oac-static"
}