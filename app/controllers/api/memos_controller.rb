class Api::MemosController < ApplicationController
    skip_before_filter :verify_authenticity_token, only: :create # どうやらこの記述が必要
  
    def create
      ret = {text: "text"}
      render :json => ret
      # memo = Memo.new(create_params)
  
      # エラー処理
      # if memo.save # もし、memoが保存できたら
      #   memoj = {text: memo.text, check: "check"}
      #   render :json => memoj
      # else
      #   @error_message = [memo.errors.full_messages].compact # エラーが入ってるインスタンス変数を定義
      #   render :json => @error_message
      # end
    end
  
  
    private
    def create_params
      params.permit(:text)
    end
end
