class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(post_training_id: params[:post_training_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(post_training_id: params[:post_training_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
