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

  def edit
    @review=Review.find_by(id: params[:id])
  end

  def update
    @review=Review.find_by(id: params[:id])
    @review.comment=params[:comment]
    @review.point=params[:point]
    if @review.save
      flash[:notice]="レビューの編集しました"
      redirect_to("/posts/#{@review.post_id}/show")
    else
      flash[:alert]="レビューの編集ができませんでした"
      render("reviews/edit")
    end
  end

  def destroy
    @review=Review.find_by(id: params[:id])
    if @review.destroy
      flash[:notice]="レビューを削除しました"
      redirect_to("/posts/#{@review.post_id}/show")
    else
      flash[:alert]="レビューの削除ができませんでした"
      render("posts/index")
    end
  end
end
