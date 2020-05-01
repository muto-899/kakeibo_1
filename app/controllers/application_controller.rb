class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
        flash[:notice] = "ログインに成功しました"
        home_index_path(current_user.id)
  end
  
  def after_sign_out_path_for(resource)
        root_path
  end
  
  def time_now
    @date = DateTime.now
  end
  
end