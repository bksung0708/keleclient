require './lib/roadmap'
require './lib/message'
require 'httparty'
require 'json'

class Kele
  include HTTParty
  include Roadmap
  include Message

  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    @email = email
    @password = password
    response = self.class.post("/sessions", body: { "email": @email, "password": @password } )
    @auth_token = response['auth_token']
  end

  def get_me
    response = self.class.get('/users/me', headers: { "authorization" => @auth_token } )
    @user_data = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token } )
    @mentor_availability = JSON.parse(response.body)
  end
end
