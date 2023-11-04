class ApplicationController < ActionController::Base
  # Create currentUser method to provide a dummy response with the first user from the database
  def current_user
    @first_user = User.first
  end
end
