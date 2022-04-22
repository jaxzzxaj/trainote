Rails.application.routes.draw do
  #"/"のリクエストをされたときに行動するアクションを設定。
  root to: 'manages#index'

end
