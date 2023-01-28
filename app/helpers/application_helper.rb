module ApplicationHelper

  def t(*args)
    locale = if user_signed_in? && !params[:language]
               current_user.language
             elsif params[:language]
                params[:language]
              else
                I18n.default_locale
             end
    I18n.t(*args, locale: locale)
  end
end
