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

resource "aws_route53_zone" "zone" {
  name = var.domain
}

resource "aws_acm_certificate" "wildcard" {
  domain_name               = var.domain
  subject_alternative_names = ["*.${var.domain}"]
  validation_method         = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  for_each = {
  for dvo in aws_acm_certificate.wildcard.domain_validation_options : dvo.domain_name => {
    name   = dvo.resource_record_name
    record = dvo.resource_record_value
    type   = dvo.resource_record_type
  }
  }

  allow_overwrite = true
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  zone_id         = aws_route53_zone.zone.id
}

resource "aws_acm_certificate_validation" "validation" {
  certificate_arn         = aws_acm_certificate.wildcard.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}