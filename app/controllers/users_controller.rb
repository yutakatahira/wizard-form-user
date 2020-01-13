class UsersController < ApplicationController

  def step1
    @user = User.new
    @user_detail = @user.build_user_detail
  end

  def step2
    @user = User.new(
      nickname: session[:nickname] = user_params[:nickname], 
      email: session[:email] = user_params[:email], 
      password: session[:password] = user_params[:password], 
      password_digest: session[:password_digest] = user_params[:password_digest]
      )
    @user.build_user_detail(
      last_name: session[:last_name] = user_params[:user_detail_attributes][:last_name], 
      first_name: session[:first_name] = user_params[:user_detail_attributes][:first_name], 
      last_name_kana: session[:last_name_kana] = user_params[:user_detail_attributes][:last_name_kana], 
      first_name_kana: session[:first_name_kana] = user_params[:user_detail_attributes][:first_name_kana], 
      birth_year: session[:birth_year] = user_params[:user_detail_attributes]["birth_day(1i)"], 
      birth_month: session[:birth_month] = user_params[:user_detail_attributes]["birth_day(2i)"], 
      birth_day: session[:birth_day] = user_params[:user_detail_attributes]["birth_day(3i)"]
      )
    render 'users/step1' unless @user.valid?(:step2)
  end

  def new
    @user = User.new
    @user.build_user_detail(
      phone_number: session[:phone_number] = user_params[:user_detail_attributes][:phone_number]
      )
    render 'users/step2' unless @user.valid?(:new)
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password_digest: session[:password_digest],
      password: session[:password_digest]
      )
    @user.build_user_detail(
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
      phone_number: session[:phone_number],
      city: user_params[:user_detail_attributes][:city],
      address: user_params[:user_detail_attributes][:address],
      building_name: user_params[:user_detail_attributes][:building_name],
      prefecture_id: user_params[:user_detail_attributes][:prefecture_id],
      postal_code: user_params[:user_detail_attributes][:postal_code],
      introduction: user_params[:user_detail_attributes][:introduction]
      )

    if @user.save
       @user.user_detail.user_id = @user.id
       session.clear
       render :create
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_digest, :remember_token,user_detail_attributes: [:last_name, :first_name, :last_name_kana, :first_name_kana,"birth_day(1i)" , "birth_day(2i)", "birth_day(3i)", :phone_number, :city, :address, :building_name, :prefecture_id, :postal_code, :introduction])
  end

end
