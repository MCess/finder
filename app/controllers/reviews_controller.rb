class ReviewsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

# #   def admin
# #     if current_user.admin
# #       @all_posts = Post.all
# #     end
# #   end

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

#   def show
#     @organizations = Organization.find(params[:id])   
#   end

#   def edit
#     @post = Post.find(params[:id])
#   end

#   def update
#     @post= Post.find(params[:id])
#     if @post.update(post_params)
#       redirect_to @post
#     else
#       render 'edit'
#     end
#   end

#   def destroy
#     @post = Post.find(params[:id])
#     if @post.destroy
#       flash[:notice] = "Successfully deleted post!"
#       redirect_to posts_path
#     else
#       flash[:alert] = "Errors deleting post!"
#       render 'destroy'
#     end
#   end

  private
  
  def review_params
     params.require(:review).permit(:name, :organization_id, :feedback, :rating, :recommend)
  end

  # def find_org
  #   @organizations = Organization.find_by_id(params[:id])
  # end


end