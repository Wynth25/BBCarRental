class UsersController < ApplicationController
  def index
    valid_columns = {
      "id"    => "users.id",
      "name"  => "name",
      "email" => "email",
      "count" => "COUNT(reservations.id)"
    }

    sort_key = valid_columns.key?(params[:sort]) ? params[:sort] : "id"
    sort_column = valid_columns[sort_key]
    sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"

    @users = User.left_joins(:reservations)
      .group('users.id')
      .order("#{sort_column} #{sort_direction}")
  end

  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations.includes(:car)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'Uživatel byl úspěšně vytvořen.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Uživatel byl úspěšně upraven.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to users_path, notice: 'Uživatel byl úspěšně smazán.'
    else
      redirect_to @user, alert: "Nelze smazat uživatele, který má evidované rezervace."
    end
  end
end