# frozen_string_literal: true
Rails.application.routes.draw do
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  resources :users, only: [:index, :show]
  resources :orders, except: [:new, :edit]
  resources :customers, except: [:new, :edit]
  resources :sample_orders, except: [:new, :edit]
  resources :six_pack_orders, except: [:new, :edit]
  resources :twelve_pack_orders, except: [:new, :edit]
  resources :twenty_four_pack_orders, except: [:new, :edit]
  resources :month_reports, except: [:new, :edit]
  resources :subscribers, except: [:new, :edit]
  resources :subscriber_counts, except: [:new, :edit]
  resources :update_dates, except: [:new]
  resources :rdates, except: [:new]
  resources :all_orders, only: [:index]
end
