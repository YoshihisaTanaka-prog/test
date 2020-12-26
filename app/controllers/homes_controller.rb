class HomesController < ApplicationController

    def index
        @memos = Memo.all.order(:id)
    end

    def detail
        @memo = Memo.where(id: params["id"]).last
    end

end
