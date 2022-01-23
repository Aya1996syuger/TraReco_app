class SharesController < ApplicationController
      before_action :search
     
    def search
        @q = Record.ransack(params[:q])
    end

    def top
        @newrecords = Record.limit(5).order(created_at: :desc)
        @records = Record.all
        @shares= Share.limit(5)
        @genres= Genre.all
       
    end
    
     def index
        @q = Record.ransack(params[:q])
        @shares= @q.result(distinct: true).page(params[:page]).per(16)
        @genres= Genre.all
     end
    
    def show
         @record = Record.find(params[:id])
         @q = Record.ransack(params[:q])
        @shares= @q.result(distinct: true).page(params[:page]).limit(4).order(created_at: :desc)
    end
    
    private
    
    def set_q
        @q = record.ransack(params[:q])
    end
    
    
      def record_params
        params.require(:share).permit(:prefecture_id, :record_id, :customer_id, :record_date, :title, :price, :member, :body, :range, :search, :word, post_files_images: []).merge(customer_id: current_customer.id)
        
      end
end
