class ListsController < ApplicationController
  def new
    @list = List.new
    # Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する
  end
  
  def create
    # 1.データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      #3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      #flash.nowで失敗したメッセージを定義する 
      flash.now[:alert] = "投稿に失敗しました" #キーをalertに変更
      render :new #new⇒indexへ変更
    end 
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list = List.find(params[:id]) #データをid番号を使って取得⇒list変数に格納する
    list.destroy #取得したデータを削除する
    redirect_to '/lists' #リダイレクトを
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
