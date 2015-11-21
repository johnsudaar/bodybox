class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_session


  def set_session
    if cookies[:token]
      if ! session[cookies[:token]]
        session[cookies[:token]] = []
      end
    else
      uuid = SecureRandom.uuid
      cookies[:token] = uuid
      session[uuid] = {}
    end

    @session = session[cookies[:token]]
    puts @session
  end
end
