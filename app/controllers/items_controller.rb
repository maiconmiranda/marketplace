class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]

    def home
    end
  
    def index
      @items = Item.all 
    end
  
    def show
      @item = Item.find(params[:id])
    end
  
    def new
      @item = Item.new
    end
  
    def create       
      current_user.items.create(item_params)       
      redirect_to items_path
    end
  
    def destroy
      @item = Item.find(params[:id])    
      @item.destroy    
      redirect_to items_path
    end   
   

    private

    # def selected
    #     @item = Item.find(params[:id])
    # end

    def item_params
        params.require(:item).permit(:name, :description, :location, :price, :picture)
    end

end
