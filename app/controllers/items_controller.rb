class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

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

    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        redirect_to items_path      
    end

    def selected
        @items = []
        item = Item.find(params[:id])
        @items.push(item)
    end
   

    private

    # def selected
    #     @item = Item.find(params[:id])
    # end

    def item_params
        params.require(:item).permit(:name, :description, :location, :price, :picture)
    end

end
