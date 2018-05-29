class MemosController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  # 인덱스와 show를 제외하고는 유저가 로그인 했는지 확인해라.
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  
  def index
    # @memos = Memo.all
    @memos = Memo.order(created_at: :DESC)
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    # 뉴를할 때 memo_params를 실행할건데 그거는 및에 private있는 부분!
    # @memo.title =params[:memo][:title]
    # @memo.content = params[:memo][:content]
    # @memo.user_id = params[:memo][:user_id]
    @memo.save
    
    redirect_to @memo
    # @memo.save를 하면은 id를가진 메모하나가 새로 생기는데, 바로 그 메모로 간다.
  end

  def show
    # @memo = Memo.find(params[:id])
  end

  def edit
    # @memo = Memo.find(params[:id])
  end

  def update
    # @memo = Memo.find(params[:id])
    # @memo.title =params[:memo][:title]
    # @memo.content = params[:memo][:content]
    # @memo.user_id = params[:memo][:user_id]
    # @memo.save
    @memo.update(memo_params)
    
    redirect_to @memo
  end

  def destroy
    # @memo = Memo.find(params[:id])
    @memo.destroy
    
    redirect_to memos_path
  end
  
  private
  def set_memo
    @memo = Memo.find(params[:id])
  end
  
  def memo_params
    params.require(:memo).permit(:user_id, :title, :content)
    # permit안에 있는 것만된다.메모에 대해서 얘네만 받아올 거야.//메모에 대해서 요구를 하고, params로 받아올 것ㄴ데 user_id, title, content만 받아올거야.
  end
end
