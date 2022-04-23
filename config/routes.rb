Rails.application.routes.draw do
  #devise_for :usersはユーザーの登録やログイン、ログアウトの機能は実装されている。
  devise_for :users
  #"/"のリクエストをされたときに行動するアクションを設定。
  root to: 'manages#index'

  #テーブルに対して、許可するアクションの設定。
end
