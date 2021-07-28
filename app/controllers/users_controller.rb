class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @user_friends = current_user.friends
  end

  def search
    if params[:email].present?
      @friend = User.check_db(params[:email])
      if @friend
        respond_to do |format|
          format.js { render partial: 'users/results' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = 'Please enter a valid symbol to search'
          format.js { render partial: 'users/results' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Please enter a symbol to search'
        format.js { render partial: 'users/results' }
      end
    end
  end
end
