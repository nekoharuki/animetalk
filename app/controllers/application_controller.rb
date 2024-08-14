class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    @current_user=User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user==nil
      flash[:notice]="まだログインできていません"
      redirect_to("/login")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice]="現在ログイン中です"
      redirect_to("/posts/index")
    end
  end

  def ensure_correct_user
    if @current_user.id!=params[:id].to_i
      flash[:notice]="あなたにはその権限がありません"
      redirect_to("/users/index")
    end
  end

  def authenticate_review
    @review=Review.find_by(id: params[:id])
    if @review.user_id!=@current_user.id
      flash[:notice]="あなたにはその権限がありません"
      redirect_to("/posts/#{@review.post_id}/show")
    end
  end



  def render_404
    respond_to do |format|
      format.html { render file: Rails.public_path.join('404.html'), status: :not_found }
      format.json { render json: { error: 'Not Found' }, status: :not_found }
      format.all { render nothing: true, status: :not_found }
    end
  end

end
