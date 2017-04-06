class OrganizationsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :home]

   def home
  
   end

   def index
     @organizations = Organization.all
    end

  #   def admin
  #     if current_user.admin
  #       @all_posts = Post.all
  #     end
  #   end

    def new
       @organizations = Organization.new
    end

    def create
      @organizations = Organization.new(org_params)
      @organizations.creator_id = current_user.id
      if @organizations.save
        flash[:notice] = "Successfully created organization profile!"
        redirect_to '/'
      else
        flash[:alert] = "Error creating new org!"
        render 'new'
      end
    end

    def show
      @organizations = Organization.find(params[:id])   
    end

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
    
    def org_params
       params.require(:organization).permit(:name, :description, :era_served, :category, :email, :phone, :zipcode, :address1, :address2, :city, :state, :url)
    end

    def find_org
      @organizations = Organization.find_by_id(params[:id])
    end
  

end
