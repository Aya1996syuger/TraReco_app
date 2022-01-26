class SchedulesController < ApplicationController
    def new
        @schedule= Schedule.new
        @genres= Genre.where(customer_id: current_customer.id)

    end
    
    def create
        @schedule = Schedule.new(schedule_params)
        if @schedule.save
            flash[:notice] = "登録が完了しました。"
            redirect_to plan_schedules_path(@schedule.plan_id)
        else
            @genres= Genre.where(customer_id: current_customer.id)
            render:new
        end
    end
    
    def index
        @plan = Plan.find(params[:plan_id])
        @schedules = Schedule.where(plan_id: params[:plan_id]).order(start_time: :asc).page(params[:page]).per(12)
    end
    
    
    def edit
        @schedule = Schedule.find(params[:id])
    end
    
    #プランアップデート
    def update
        schedule = Schedule.find(params[:id])
        if schedule.update(schedule_params)
           redirect_to plan_schedules_path
        else
            render :new 
            @genres= Genre.where(customer_id: current_customer.id)
        end
    end
    
    #プラン削除
    def destroy
        @schedule = Schedule.find(params[:id])
        @schedule.destroy
        redirect_to plan_schedules_path
    end
    
    
     private
    def schedule_params
        params.require(:schedule).permit( :plan_id, :genre_id, :plan_title, :date,:budget, :address, :start_time, :finish_time, :memo,:genre).merge(plan_id: params[:plan_id])
    end   
end
