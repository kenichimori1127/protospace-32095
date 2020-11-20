class PrototypesController < ApplicationController
before_action :authenticate_user!, only: [:update, :edit]
# before_action :move_to_index, except: [:index]
  def index #index.html.erbへ #config/routes.rbからの指示
   @prototypes = Prototype.all

  end

  def new
   @prototype = Prototype.new
  end

  def create
   @prototype = Prototype.new(prototype_params)
   if @prototype.save #prototypeテーブルに保存する
      redirect_to root_path #リダイレクトされてindex.html.erbに戻る
   else
      render :new #保存失敗の場合、newアクションでnew.html.erbに渡され同じページに戻る
   end
  end

  def show
   @prototype = Prototype.find(params[:id])
   @comment = Comment.new
   @comments = @prototype.comments.includes(:user)
  end

  def edit
   @prototype = Prototype.find(params[:id])
   unless @prototype.user_id == current_user.id
     redirect_to root_path
end
  end

  def update
   @prototype = Prototype.find(params[:id])
   if @prototype.update(prototype_params)
      redirect_to prototype_path
   else
   render :edit #保存失敗の場合、updateアクションでedit.html.erbに渡され同じページに戻る
   end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
     @prototype.destroy
      redirect_to root_path #削除後、リダイレクトでindex.html.erbに戻る
  end
  private

  def prototype_params
   params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
   #privateメソッドとしてprototype_paramsを定義し、permitメソッド内のキーをprototypeテーブルへ保存出来るようにする
  end
#   def move_to_index
#     unless user_signed_in?
#       redirect_to action: :index
#     end
#   end
#     def move_to_index
#     redirect_to new_user_session_path unless user_signed_in?
#   end
end
