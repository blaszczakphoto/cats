class RatesController < ApplicationController
  def create
  	Rate.create(photo_id: params[:photo_id], user_id: current_user)

  	redirect_to '/'
  end

end
