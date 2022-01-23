class ListsController < ApplicationController
    
    protect_from_forgery
    
    def index
        @list = List.new
        @lists= List.where(customer_id: current_customer.id).page(params[:page]).per(6)
        @genres= Genre.where(customer_id: current_customer.id)
      
    end
    
    def create
         @list = List.new(list_params)
         @list.customer_id = current_customer.id
         @list.save
         redirect_to lists_path
         
    end
    
    def update
        @list = List.find(params[:id])
        @list.update(list_params)
        redirect_to lists_path
    end
    
    def map
         @list = List.find(params[:id])
       
      
    end
    
    def destroy
        @list = List.find(params[:id])
        @list.destroy
        redirect_to lists_path
    end



    private
      def list_params
        params.require(:list).permit(:customer_id, :prefecture_id, :name, :genre_id, :spot_name, :prefecture_area, :address, :check_box)
      end
end