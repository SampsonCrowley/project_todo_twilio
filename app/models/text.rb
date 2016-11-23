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



  # alternatively, you can preconfigure the client like so
  # Twilio.configure do |config|
  #   config.account_sid = account_sid
  #   config.auth_token = auth_token
  # end
  # and then you can create a new client without parameters
  # @client = Twilio::REST::Client.new
