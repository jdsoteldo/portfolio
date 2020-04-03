class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  # Crea la cookie con la variable
  # del lenguaje
  def set_locale
    if cookies[:locale]
      # si hay una cookie en el navegador
      # traela y haz locale igual a esa variable
      locale = cookies[:locale]
    else
      # si no hay cookie en el navegador busca
      # en la respuesta del navegador el lenguaje
      # por defecto
      locale = extract_locale_from_accept_language_header
    end
    # Toma la variable locale de arriba y la vuelve
    # un simbolo
    I18n.locale = I18n.available_locales.include?(locale.strip.to_sym) ? locale.strip.to_sym : I18n.default_locale
    # crea una cookie con el simbolo
    cookies[:locale] = locale
  end

  # Cambia la variable del lenguaje
  def change_locale
    # Toma la variable del lenguaje
    # de los parametros
    locale = params[:locale]
    # verifica si la variable existe sino toma la
    # que viene por defecto
    I18n.locale = I18n.available_locales.include?(locale.strip.to_sym) ? locale.strip.to_sym : I18n.default_locale
    # crea la cookie
    cookies[:locale] = locale
    if request.referrer
      redirect_to request.referrer
    else
      redirect_to "/"
    end
  end

  private

    def extract_locale_from_accept_language_header
      if request.env["HTTP_ACCEPT_LANGUAGE"]
        return request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
      end
      "end"
    end

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :nickname, :first_name, :last_name])
  end

end
