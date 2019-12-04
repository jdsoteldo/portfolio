class ApplicationController < ActionController::Base
  class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
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

    def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end
    helper_method :mobile_device?

    # La ruta esta estatica por favor no borrar la ruta o el archivo
    def get_asset(name)
      if Rails.env.development?
        if Rails.application.assets
          asse = File.read('app/assets/Bootcamp_Syllabus.pdf')
          return asse.to_s if asse
        end
      elsif Rails.env.production?
        asse = File.read('app/assets/Bootcamp_Syllabus.pdf')
        return asse.to_s if asse
      end
    end

    private
      def extract_locale_from_accept_language_header
        if request.env["HTTP_ACCEPT_LANGUAGE"]
          return request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
        end
        "end"
      end
  end

end
