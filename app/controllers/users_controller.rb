class UsersController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update, :index, :show, :destroy]
  before_action :forbid_login_user, only: [:login, :login_form, :new, :create]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりません"
      redirect_to("/users/index")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user.nil?
      flash[:alert] = "ユーザーが見つかりません"
      redirect_to("/users/index")
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(name: params[:name], email: params[:email], password: params[:password])
      flash[:notice] = "アカウントを編集しました"
      redirect_to("/users/index")
    else
      flash[:alert] = "アカウントを編集ができませんでした"
      render("users/edit")
    end
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "アカウントを登録しました"
      redirect_to("/users/index")
    else
      flash[:alert] = "アカウントの登録ができませんでした"
      render("users/new")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      session[:user_id] =nil
      flash[:notice] = "アカウントを削除しました"
      redirect_to("/login")
    else
      flash[:alert] = "アカウントを削除できませんでした"
      render("users/show")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインできました"
      redirect_to("/posts/index")
    else
      flash[:alert] = "メールアドレスまたはパスワードが間違っています"
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
