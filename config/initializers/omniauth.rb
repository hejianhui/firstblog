Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['github_app_id'], ENV['github_app_secret'],
    token_params: {redirect_uri: "https://shadowshake.herokuapp.com:3000/auth/github/callback" }
end
