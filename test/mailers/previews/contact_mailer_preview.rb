# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact
  def contact
    @user = User.last
    ContactMailer.with(user: @user, content: 'this is the content').contact
  end

end
