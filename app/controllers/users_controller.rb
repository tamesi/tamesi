class UsersController < ApplicationController
before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
  	@user = User.all
    @book = Book.new
  end

  def edit
  	    @user = User.find(params[:id])
        # binding.pry
      if @user.id != current_user.id
        flash[:notice] = "can't successfully access!!"
        redirect_to user_path(@user)
      end
  end


  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "Book was successfully update."
    redirect_to root_path
  else
    render 'edit'
  end
  end

  private
	def user_params
		params.require(:user).permit(:name, :email, :image, :introduction)
	end
end


