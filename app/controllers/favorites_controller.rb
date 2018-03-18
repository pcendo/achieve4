class FavoritesController < ApplicationController
    def create
    favorite = current_user.favorites.create(place_id: params[:place_id])
    redirect_to places_path, notice: "お気に入りに登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(place_id: params[:id]).destroy
    redirect_to favorites_path, notice: "お気に入りを解除しました"
  end
  
  def index
    @favorites_places = current_user.favorite_places
  end
  
  private
  def place_params
    params.require(:place).permit(:image, :content, :user_id, :latitude, :longitude)
  end
end
