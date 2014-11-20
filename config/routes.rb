KAPSMembers::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'results' => 'members#results'
  root :to => 'members#search'
end
