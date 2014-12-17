# -*- encoding : utf-8 -*-
module AuthenticatedSystem

  def current_user
    cookies[:user_id] ||= new_user
  end

  private
  def new_user
    cookies.permanent[:user_id] = generate_id
  end

  private
  def generate_id
    rand(99999)
  end

end