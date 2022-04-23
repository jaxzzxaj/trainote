class ManagesController < ApplicationController
  #ログインしていないuserをログインページ画面に強制移動
  before_action :authenticate_user!

  def index
  end
end
