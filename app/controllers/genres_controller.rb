class GenresController < ApplicationController
    
    #ジャンル一覧・作成
    def index
        @genre = Genre.new
        @genres = Genre.where(customer_id: current_customer.id).page(params[:page]).per(10)
        
        

    end
    
    def create
        @genre = Genre.new(genre_params)
        @genre.customer_id = current_customer.id
        if @genre.save
            flash[:notice] = "登録が完了しました。"
            redirect_to genres_path
        else
            @genres = Genre.where(customer_id: current_customer.id).page(params[:page]).per(10)
            render:index
        end
    end
    
    #ジャンル編集
    def edit
        @genre = Genre.find(params[:id])
    end
    
    #ジャンルアップデート
    def update
        genre = Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to genres_path
    end
    
    #ジャンル削除
    def destroy
        @genre = Genre.find(params[:id])
        @genre.destroy
        redirect_to genres_path
    end
    
    #ストロングパラメータ
    private
    def genre_params
        params.require(:genre).permit(:customer_id, :name)
    end

end