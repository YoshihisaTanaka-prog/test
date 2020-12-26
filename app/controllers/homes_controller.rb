class HomesController < ApplicationController

    def index
        @memos = Memo.all
    end

    def detail
        @memo = Memo.where(id: params["id"]).last
    end

end
