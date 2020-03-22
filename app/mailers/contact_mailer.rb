class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact
    @name = params[:contact][:name]
    @email = params[:contact][:email_address]
    @message = params[:contact][:message]
    mail(to: "demomap@reinstraum.net", subject: 'New Mail from DemoMap Contact', from: @email)
  end
end
