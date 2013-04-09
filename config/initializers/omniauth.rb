Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '549795675138.apps.googleusercontent.com', 'h7YF36n3WDu-fWTCArLeXfgW', :scope => 'https://sites.google.com/feeds'
end