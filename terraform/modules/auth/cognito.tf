variable "prefix" {}

resource "aws_cognito_user_pool" "ykoba-user-pool" {
  name              = "${var.prefix}-user-pool"
  mfa_configuration = "OFF"
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = true
    invite_message_template {
      email_message = "{username}さん、あなたの初期パスワードは {####} です。初回ログインの後パスワード変更が必要です。"
      email_subject = "${var.prefix}への招待"
      sms_message   = "{username}さん、あなたの初期パスワードは {####} です。初回ログインの後パスワード変更が必要です。"
    }
  }

  alias_attributes = ["email"]
}

resource "aws_cognito_user_pool_domain" "ykoba-user-pool-domain" {
  domain       = "${var.prefix}-client"
  user_pool_id = aws_cognito_user_pool.ykoba-user-pool.id
}

resource "aws_cognito_user_pool_client" "ykoba-user-pool-client" {
  name            = "${var.prefix}-client"
  user_pool_id    = aws_cognito_user_pool.ykoba-user-pool.id
  generate_secret = false
  callback_urls   = [
    "http://localhost:8080/"
  ]
  allowed_oauth_flows = ["code"]
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH"
  ]
  supported_identity_providers = [
    "COGNITO"
  ]
  allowed_oauth_scopes                 = ["openid"]
  allowed_oauth_flows_user_pool_client = true
}

resource "aws_cognito_identity_pool" "ykoba-identity-pool" {
  identity_pool_name               = "${var.prefix}-id-pool"
  allow_unauthenticated_identities = false
  allow_classic_flow               = false

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.ykoba-user-pool-client.id
    provider_name           = aws_cognito_user_pool.ykoba-user-pool.endpoint
    server_side_token_check = false
  }
}
