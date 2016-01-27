class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.new(review_params)
    @review.chef = current_user
    if @review.save
      flash[:success] = "Your review was successfully created."
      redirect_to @recipe
    else
      flash[:danger] = "You can only create one review per recipe."
      redirect_to :back
    end
  end
  
  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review deleted."
    redirect_to recipes_path
  end
  
  private
  
    def review_params
      params.require(:review).permit(:description, :chef_id, :recipe_id)
    end
end