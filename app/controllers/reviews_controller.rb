class ReviewsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def new
     @reviews = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Successfully created a review!"
      redirect_to @review.organization
    else
      flash[:alert] = "Error creating review!"
      render 'new'
    end
  end

  private
  
  def review_params
     params.require(:review).permit(:name, :organization_id, :feedback, :rating, :recommend)
  end


end