data "aws_lambda_function" "lambda_edge" {
  function_name = var.aws_lambda_function_lambda_edge_function_name
}