class ApplicationController < ActionController::Base
  def current_user
    # It will return the first user from the database.
    User.first
  end
end
