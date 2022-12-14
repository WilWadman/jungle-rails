class AuthsController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password'], 

  def index
    render plain: "Everyone can see me!"
  end

  def edit
    render plain: "I'm only accessible if you know the password"
  end
end


