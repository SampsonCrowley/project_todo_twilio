class Text
  # set up a client to talk to the Twilio REST API
  @@client = Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]


  def self.send_msg(msg)
    @@client.messages.create(
      from: ENV['from_number']
      to: ENV['to_number'],
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
