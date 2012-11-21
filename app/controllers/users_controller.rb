class UsersController < ApplicationController
  before_filter :authenticate_user!

  def sign_in
  	redirect_to lists_path
  end

  def password_match?
    self.errors[:password] << 'must be provided' if password.blank?
    self.errors[:password] << 'and confirmation do not match' if password != password_confirmation
    password == password_confirmation and !password.blank?
  end

end
