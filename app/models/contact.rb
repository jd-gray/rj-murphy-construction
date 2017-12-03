class Contact < MailForm::Base
  attribute :name,    validate: true
  attribute :email,   validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  def headers
    {
      subject: 'Contact Form',
      to: ENV['company_email'],
      from: %("#{name}" <#{email}>)
    }
  end
end
