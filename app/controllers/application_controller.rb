class ApplicationController < ActionController::API
    def fallback_html
        render :file => 'public/index.html'
    end
end
