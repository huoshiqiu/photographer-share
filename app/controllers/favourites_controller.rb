class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:favourite][:photo_id])
    current_user.favourite!(@photo)
    respond_to do |format|
      # format.html { redirect_to current_user}
      format.js
    end
  end

  def destroy
    @photo = Favourite.find(params[:id]).photo
    current_user.unfavourite(@photo)
    respond_to do |format|
      # format.html { redirect_to current_user }
      format.js
    end
  end
end
