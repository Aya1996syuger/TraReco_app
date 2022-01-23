class RecordsController < ApplicationController
    def new
        @record = Record.new
        @genres = Genre.where(customer_id: current_customer.id)
        @itineraries = Itinerary.where(customer_id: current_customer.id)
       
    end
    
    def create
        @record = Record.new(record_params)
        @record.customer_id = current_customer.id
        #投稿
           
            if @record.save
                redirect_to records_path
            else
                @genres = Genre.where(customer_id: current_customer.id)
                @itineraries = Itinerary.where(customer_id: current_customer.id)
                render :new
            end
    end
        
    def index
        @records = Record.where(customer_id: current_customer.id).page(params[:page]).per(16)
        
    end
    
    def show
        @record = Record.find(params[:id])
    end
    
    def edit
        @record = Record.find(params[:id])
        @genres= Genre.where(customer_id: current_customer.id)
    end
    
    def destroy
        @record = Record.find(params[:id])
        @record.destroy
        redirect_to records_path
    end
    
    def update
    @record = Record.find(params[:id])
    @record.update(record_params)
    redirect_to records_path
    end
   
   
   
    private
      def record_params
        params.require(:record).permit( :itinerary_id, :customer_id, :genre_id, :prefecture_id, :record_date, :title, :price, :address, :member, :body, post_files_images: [])
      end
  
end
