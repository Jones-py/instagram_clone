class ChatMailer < ApplicationMailer
  def chat_mail(chat)
      @chat=chat
      mail to: @chat.user.email,  subject: "Inquiry email confirmation"
    end
end
