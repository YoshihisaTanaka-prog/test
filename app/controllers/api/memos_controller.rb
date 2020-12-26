class Api::MemosController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy] # どうやらこの記述が必要
  
    def create
      # ret = {text: "text"}
      # render :json => ret
      memo = Memo.new
      memo.text = params[:text]
      memo.title = params[:title]
  
      # エラー処理
      if memo.save # もし、memoが保存できたら
        render :json => memo
      else
        @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
        render :json => @error_message
      end
    end
  
    def index
      ret = Memo.all.order(:id)
      render :json => ret
    end

    def update
      memo = Memo.where(id: params["id"]).last
      memo.text = params[:text]
      memo.title = params[:title]
  
      # エラー処理
      if memo.save # もし、memoが保存できたら
        render :json => memo
      else
        @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
        render :json => @error_message
      end
    end

    def destroy
      memo = Memo.where(id: params["id"]).last
      memo.destroy
    end
  
    # private
    # def create_params
    #   params.permit(:text)
    # end
end
