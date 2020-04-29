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
  delete 'apr_dates/:id/destroy', to:'apr_dates#destroy'
  get 'apr_dates/income', to:'apr_dates#income'
  get 'apr_dates/pay', to:'apr_dates#pay'
  post 'apr_dates/:id/update', to:'apr_dates#update'
  resources :apr_dates
  
  post 'may_dates/create', to:'may_dates#create'
  delete 'may_dates/:id/destroy', to:'may_dates#destroy'
  get 'may_dates/income', to:'may_dates#income'
  get 'may_dates/pay', to:'may_dates#pay'
  resources :may_dates
  
end