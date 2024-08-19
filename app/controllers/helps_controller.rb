class HelpsController < ApplicationController

  def create
    @help=Help.new(user_id: @current_user.id,review_id: params[:review_id],post_id: params[:post_id])
    @post=Post.find_by(id: @help.post_id)
    @current_user=User.find_by(id: session[:user_id])
    @reviews=Review.where(post_id: @post.id)
    if @help.save
      flash[:notice]="役に立ったを押しました"
      redirect_to("/posts/#{@post.id}/show")
    else
      flash[:alert]="役に立つを押せませんでした"
      render("posts/show")
    end
  end

  def destroy
    @help=Help.find_by(user_id: @current_user.id,review_id: params[:review_id],post_id: params[:post_id])
    @post=Post.find_by(id: @help.post_id)
    @reviews=Review.where(post_id: @post.id)
    @current_user=User.find_by(id: session[:user_id])
    if @help.destroy
      flash[:notice]="役に立つを削除できました"
      redirect_to("/posts/#{@post.id}/show")
    else
      flash[:alert]="役に立つを削除できませんでした"
      render("posts/show")
    end
  end
end
