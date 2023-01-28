class LanguagesController < ApplicationController
  before_action :authenticate_user!
  def change
    language = params[:language]
    current_user.update(language: language)
    redirect_to root_path
  end
end
