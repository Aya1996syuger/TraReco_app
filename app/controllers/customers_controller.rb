class CustomersController < ApplicationController
    def show
        @customer = Customer.find(params[:id])
    end
    
    #マイページ編集
    def edit
        @customer = Customer.find(params[:id])
    end
    
    #マイページ更新
    def update
        customer = Customer.find(params[:id])
        if customer.update(customer_params)
          flash[:notice] = "You have updated book successfully."
          redirect_to customer_path(customer.id)
        else
          @customer = customer
          render :edit
        end
    end
    
    private
    def customer_params
        params.require(:customer).permit(:name, :birthday, :birthplace, :email, :gender)
    end

end
