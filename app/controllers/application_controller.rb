class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    if I18n.available_locales.map(&:to_s).include?(parsed_locale)
      parsed_locale.to_sym
    else
      nil
    end
  end
end
