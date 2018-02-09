require 'mailgun-ruby'

class Mailer
  attr_reader :mailer

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV['MAILGUN_API_KEY'])
  end

  def self.call(user, mailer = nil, mailgun_domain_name =ENV['MAILGUN_DOMAIN_NAME'])
    new(mailer: mailer).call(user, mailgun_domain_name)
  end

  def call(user, mailgun_domain_name)
    mailer.send_message(mailgun_domain_name, {from: "DwellBnB@mail.com",
      to: user.email_address,
      subject: "You have successfully registered with DwellBnB",
      text: "Thank you for registering with DwellBnB, your username is #{user.username}. Please visit us soon to book your dream trip"})
    end
end
