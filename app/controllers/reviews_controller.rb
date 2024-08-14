class ReviewsController < ApplicationController

  def create
    @review = Review.new
    @review.comment = params[:comment]
    @review.point = params[:point]
    @review.user_id=@current_user.id
    @review.post_id=params[:post_id]
    if @review.save
      flash[:notice]="レビューが投稿されました"
      @reviews=Review.where(post_id: @review.post_id)
      redirect_to("/posts/#{@review.post_id}/show")
    else
      flash[:alert]="レビューが投稿できませんでした"
      render("posts/show")
    end
  end
end
