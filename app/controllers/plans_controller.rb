class PlansController < ApplicationController
    def new
        @plan = Plan.new
    end
    
    def create
        @plan = Plan.new(plan_params)
        @plan.customer_id = current_customer.id
        @plan.save
        flash[:notice] = "登録が完了しました。"
        redirect_to plans_path
    end
    
    def index
        @plans = Plan.where(customer_id: current_customer.id).page(params[:page]).per(12)
    end
    

    def edit
        @plan = Plan.find(params[:id])
    end
    
    #プランアップデート
    def update
        plan = Plan.find(params[:id])
        plan.update(plan_params)
        redirect_to plans_path
    end
    
    #プラン削除
    def destroy
        @plan = Plan.find(params[:id])
        @plan.destroy
        redirect_to plans_path
    end
    
    
     private
    def plan_params
        params.require(:plan).permit(:customer_id, :plan_title, :date)
    end   
end
