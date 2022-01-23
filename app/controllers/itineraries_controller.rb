class ItinerariesController < ApplicationController
    
     protect_from_forgery
     
    def new
        @itinerary = Itinerary.new
    end
    
    def create
        @itinerary = Itinerary.new(itinerary_params)
        @itinerary.customer_id = current_customer.id
        @itinerary.save
        flash[:notice] = "登録が完了しました。"
        redirect_to itineraries_path
    end
    
    def index
        @itineraries = Itinerary.where(customer_id: current_customer.id).page(params[:page]).per(12)
    end
    
    def show
         @itinerary = Itinerary.find(params[:id])
         @records = @itinerary.records.where(customer_id: current_customer.id).page(params[:page]).per(8)
         
    end
    
    def edit
          @itinerary = Itinerary.find(params[:id])
    end
    
     #プランアップデート
    def update
        @itinerary = Itinerary.find(params[:id])
        @itinerary.update(itinerary_params)
        redirect_to itineraries_path
    end
    
    #プラン削除
    def destroy
        @itinerary = Itinerary.find(params[:id])
        @itinerary.destroy
        redirect_to itineraries_path
    end

    private
    def itinerary_params
        params.require(:itinerary).permit(:itinerary_id, :customer_id, :itinerary_name, :start_date, :finish_date, :image)
    end   

end
