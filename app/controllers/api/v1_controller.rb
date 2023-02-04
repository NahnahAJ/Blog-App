class Api::V1Controller < ApplicationController
  protect from forgery with: :null_session
end
