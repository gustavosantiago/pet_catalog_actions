Rails.application.routes.draw do
  mount Actions::Engine => "/actions"
end
