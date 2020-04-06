ActionMailer::Base.smtp_settings = {
  address: "elektropost.org",
  port: 587,
  domain: 'elektropost.org',
  user_name: ENV['MAIL_ADDRESS'],
  password: ENV['MAIL_APP_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
