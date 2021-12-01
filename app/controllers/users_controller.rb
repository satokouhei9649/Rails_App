class UsersController < ApplicationController
    def new
        @user = User.new()
    end
    def create
        @user = User.new(
            name: params[:name],
            email: params[:email],
            password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "登録が完了しました"
            redirect_to root_path
        else
            render("users/new")
        end
    end
    # ログイン画面へ
    def login_form
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
    # ログイン処理
    def login
        @user = User.find_by(email: params[:email],password: params[:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "ログインに成功しました！！！！！！"
            redirect_to topics_path
        else
            @error_message = "メールアドレスまたはパスワードが間違っています"
            render("login_form")
        end
    end
    def logout
        session[:user_id] = nil
        redirect_to topics_path
    end
end
