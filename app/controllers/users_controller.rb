class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy] 
    before_action :authenticate_user, only: [:edit ]

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            UserMailer.user_mail(@user).deliver
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to places_path, notice: "ユーザ情報を編集しました！"
        else
          render 'edit'
        end
    end
    
    def destroy
        @user.destroy
        redirect_to new_user_path, notice:"ユーザ情報を削除しました！"
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :name, :cname, :password,
                                     :password_confirmation, :image )
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def authenticate_user
      if logged_in?
      else
        redirect_to new_session_path
      end
    end
    
end
