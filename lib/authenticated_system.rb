# -*- encoding : utf-8 -*-
module AuthenticatedSystem

  def current_user
    cookies[:user_id] ||= new_user
  end

  private
  def new_user
    cookies[:user_id] = { :value => generate_id, :expires => 1.year.from_now }
  end

  private
  def generate_id
    rand(8)
  end

end