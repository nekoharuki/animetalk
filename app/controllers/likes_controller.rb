class LikesController < ApplicationController
  def judge
    @like=Like.new(post_id: params[:post_id],user_id: @current_user.id)
    if @like.save
      flash[:notice]="いいねしました"
      redirect_to("/posts/index")
    else
      flash[:alert]="いいねできませんでした"
      render("posts/index")
    end
  end

end
