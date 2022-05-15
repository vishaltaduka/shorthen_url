Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "url/customize_url"
  get "url/status", to: "url#status_of_url"

  root to: "url#shorthen_url"

  get "/:short", to: "url#send_to_url"
end
