module Leadgen
  class App < Padrino::Application
    register SassInitializer
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    get :index do
      redirect_to '/questions'
    end
  end
end
