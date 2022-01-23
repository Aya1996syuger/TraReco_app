class Admin::CustomersController < ApplicationController
 def index
    @customers = Customer.page(params[:page]).per(12)
    @customer = Customer.new
  end

  def create
      @customer = Customer.new(customer_params)
      @customer.save
      redirect_to admin_customers_path
  end

  def show
      @customer = Customer.find(params[:id])
  end

  def edit
      @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
   if customer.update(customer_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to admin_customer_path(customer.id)
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
