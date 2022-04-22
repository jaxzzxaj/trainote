Rails.application.routes.draw do
  devise_for :users
  #"/"のリクエストをされたときに行動するアクションを設定。
  root to: 'manages#index'

end
