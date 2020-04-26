Rails.application.routes.draw do
  root 'home#index'
  get 'dec_dates/index'
  get 'nov_dates/index'
  get 'oct_dates/index'
  get 'sep_dates/index'
  get 'aug_dates/index'
  get 'jul_dates/index'
  get 'jun_dates/index'
  get 'may_dates/index'
  get 'apr_dates/index'
  get 'mar_dates/index'
  get 'feb_dates/index'
  get 'jan_dates/index'
  
  post 'apr_dates/create', to:'apr_dates#create'
  post 'apr_dates/destroy', to:'apr_dates#destroy'
  resources :apr_dates
  
end
