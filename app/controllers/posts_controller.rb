class PostsController < ApplicationController

  before_action :authenticate_user

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], title: params[:title], genre: params[:genre],
    user_id: @current_user.id,image: params[:image],point: params[:point])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      flash[:alert] = "投稿を作成できませんでした"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.genre = params[:genre]
    @post.content = params[:content]
    @post.point = params[:point]

    original_image_url = @post.image.url

    @post.image = params[:image]

    if @post.save
      public_id = original_image_url.split('/').last.split('.').first
      Cloudinary::Uploader.destroy(public_id)
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      flash[:alert] = "投稿を編集できませんでした"
      render("posts/edit")
    end
  end
  def show
    @post = Post.find_by(id: params[:id])
    @user=@post.user
    @likes_count=Like.where(post_id: @post.id).count
    @reviews = Review.where(post_id: @post.id)
    @current_user=User.find_by(id: session[:user_id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    else
      flash[:alert] = "投稿を削除できませんでした"
      render("posts/index")
    end
  end
  def sf
    @posts=Post.where(genre: "SF")
  end
  def action
    @posts=Post.where(genre: "アクション")
  end
  def comedy
    @posts=Post.where(genre: "コメディー")
  end
  def detail
    @posts=Post.where(user_id: params[:user_id])
    @user=User.find_by(id: params[:user_id])
  end
  def good
    @likes=Like.where(user_id: params[:user_id])
    @user=User.find_by(id: params[:user_id])
  end
end
