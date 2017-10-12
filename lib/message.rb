module Message
  def get_messages(message_number = nil)
    if message_number.nil?
      response = self.class.get("/message_threads", headers: { "authorization" => @auth_token } )
    else
      response = self.class.get("/message_threads", body: { "page" => message_number }, headers: { "authorization" => @auth_token } )
    end
    @messages = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, token = nil, subject, message)
    if token.nil?
      response = self.class.post("/messages", body: { "sender" => sender, "recipient_id" => recipient_id, "subject" => subject, "stripped-text" => message} )
    else
      response = self.class.post("/messages", body: { "sender" => sender, "recipient_id" => recipient_id, "token" => token, "subject" => subject, "stripped-text" => message} )
    end
  end
end
