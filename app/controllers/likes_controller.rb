class LikesController < ApplicationController
  def create
    @like=Like.new(post_id: params[:post_id],user_id: @current_user.id)
    if @like.save
      flash[:notice]="いいねしました"
      redirect_to("/posts/index")
    else
      flash[:alert]="いいねできませんでした"
      render("posts/index")
    end
  end

  def destroy
    @like=Like.find_by(post_id: params[:post_id],user_id: @current_user.id)
    if @like.destroy
      flash[:notice]="いいねを削除しました"
      redirect_to("/posts/index")
    else
      flash[:alert]="いいねを削除できませんでした"
      render("posts/index")
    end
  end
end
