class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(inquiry)
    @inquiry = inquiry
    mail to: inquiry.mail_address, subject: "Inquiry confirm"
  end
end
