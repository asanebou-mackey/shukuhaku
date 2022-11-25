class ApplicationController < ActionController::Base

   before_action :configure_permitted_parameters, if: :devise_controller?
   protect_from_forgery with: :exception
   #ヘッダーに検索機能をつけるために追記
   before_action :set_search
   #ここまで

   protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するカラム名])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction])
  end


    private 
   def after_sign_in_path_for(resource)
      homes_index_path # ログイン後に遷移するpathを設定
   end

   def after_sign_out_path_for(resource)
      homes_index_path # ログアウト後に遷移するpathを設定
   end

   #検索機能
   def set_search
      @search = Room.ransack(params[:q]) #ransackメソッド推奨
      @search_rooms = @search.result
    end

end
