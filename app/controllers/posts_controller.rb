class PostsController < ApplicationController

  before_action :authenticate_user, only: [:edit, :update, :destroy, :new, :create, :show, :index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], title: params[:title], genre: params[:genre],
    user_id: @current_user.id,image_name: "default_post.jpg",point: params[:point])
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
    @post.point= params[:point]
    if params[:image]
      @post.image_name = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}", image.read)
    end

    if @post.save
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
end
