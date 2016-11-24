class Text
  # set up a client to talk to the Twilio REST API
  @@client = Twilio::REST::Client.new Rails.application.secrets.account_sid, Rails.application.secrets.auth_token


  def self.send_msg(msg)
    @@client.messages.create(
      from: Rails.application.secrets.from_number,
      to: Rails.application.secrets.to_number,
      body: msg
    )
  end

end
