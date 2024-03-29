class MessageMailer < ActionMailer::Base
  default from: "team@TakeHotter.com"

  def send_message participant, from, message
  	@participant = participant
  	@from = from
  	@message = message

  	mail to: @participant.email, subject: "You have a new message on TakeHotter!"
  end

end
