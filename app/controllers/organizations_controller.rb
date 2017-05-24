class OrganizationsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :home]

   def home
    @organizations  = Organization.all
   end

   def index
     @organizations = Organization.all
   end



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
      @organization = Organization.find(params[:id])
      @reviews = @organization.reviews
    end


    private
    
    def org_params
       params.require(:organization).permit(:name, :description, :era_served, :category, :email, :phone, :zipcode, :address1, :address2, :city, :state, :url)
    end

    def find_org
      @organizations = Organization.find_by_id(params[:id])
    end
  

end
