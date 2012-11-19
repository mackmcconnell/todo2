class UsersController < ApplicationController
  before_filter :authenticate_user!

  def sign_in
  end

end
