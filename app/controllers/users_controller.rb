class UsersController < ApplicationController
  def list
    if !current_user.is_admin
      raise ActionController::RoutingError.new('No Access')
    end
    @users = User.all.page(params[:page])
  end

  def view
    if (params[:id])
      if (params[:id].to_i != current_user.id.to_i) && (!current_user.is_admin)
        raise ActionController::RoutingError.new('No Access')
      else
        @User = User.find_by_id(params[:id]) or raise ActionController::RoutingError.new('Not Found')
      end

    else
      @User = User.find_by_id(current_user.id) or raise ActionController::RoutingError.new('Internal Server Error')
    end
  end
end
