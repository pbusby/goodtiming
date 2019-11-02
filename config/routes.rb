Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :stopwatches
    end
  end

  get '*path', to: "application#fallback_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

end
