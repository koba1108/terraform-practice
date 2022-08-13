resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          "Service" = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_lambda_function" "backend-test" {
  function_name = "backend-test"
  role          = aws_iam_role.iam_for_lambda.arn
  package_type  = "Image"
  image_uri = aws_ecr_repository.backend-test.repository_url
}
