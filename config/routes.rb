# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  resources :orders, except: [:new, :edit]
  resources :subscribers, except: [:new, :edit]
  resources :subscriber_counts, except: [:new, :edit]
  resources :rdates, except: [:new, :edit]
  resources :page_orders, except: [:new, :edit]
  resources :subscriptions, except: [:new, :edit]
  resources :all_orders, except: [:new, :edit]
end
