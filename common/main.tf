resource "aws_iam_user" "ecs_exec" {
  name = "ecs-exec"
}

resource "aws_iam_access_key" "ecs_exec" {
  user = aws_iam_user.ecs_exec.name
}

data "aws_iam_policy_document" "assume_ecs_exec_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = [aws_iam_user.ecs_exec.arn]
      type        = "AWS"
    }
  }
}

resource "aws_iam_role" "ecs_exec" {
  name               = "ecs-exec-role"
  assume_role_policy = data.aws_iam_policy_document.assume_ecs_exec_role.json

  managed_policy_arns = [aws_iam_policy.ecs_exec.arn]
}

resource "aws_iam_policy" "ecs_exec" {
  name = "ecs-exec-policy"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Sid      = "AccessECSEXEC"
        Action   = [
          "ecs:ListClusters",
          "ecs:ListTasks",
        ]
        Resource = "*"
      },
    ]
  })
}