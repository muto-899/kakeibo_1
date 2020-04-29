Rails.application.routes.draw do
  
  root 'home#top'
  get 'home/index', to:'home#index'
  
  devise_for :users
  
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
  
  post 'jan_dates/create', to:'jan_dates#create'
  delete 'jan_dates/:id/destroy', to:'jan_dates#destroy'
  get 'jan_dates/income', to:'jan_dates#income'
  get 'jan_dates/pay', to:'jan_dates#pay'
  post 'jan_dates/:id/update', to:'jan_dates#update'
  resources :jan_dates
  
  post 'feb_dates/create', to:'feb_dates#create'
  delete 'feb_dates/:id/destroy', to:'feb_dates#destroy'
  get 'feb_dates/income', to:'feb_dates#income'
  get 'feb_dates/pay', to:'feb_dates#pay'
  post 'feb_dates/:id/update', to:'feb_dates#update'
  resources :feb_dates
  
  post 'mar_dates/create', to:'mar_dates#create'
  delete 'mar_dates/:id/destroy', to:'mar_dates#destroy'
  get 'mar_dates/income', to:'mar_dates#income'
  get 'mar_dates/pay', to:'mar_dates#pay'
  post 'mar_dates/:id/update', to:'mar_dates#update'
  resources :mar_dates
  
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
  post 'may_dates/:id/update', to:'may_dates#update'
  resources :may_dates
  
  post 'jun_dates/create', to:'jun_dates#create'
  delete 'jun_dates/:id/destroy', to:'jun_dates#destroy'
  get 'jun_dates/income', to:'jun_dates#income'
  get 'jun_dates/pay', to:'jun_dates#pay'
  post 'jun_dates/:id/update', to:'jun_dates#update'
  resources :jun_dates
  
  post 'jul_dates/create', to:'jul_dates#create'
  delete 'jul_dates/:id/destroy', to:'jul_dates#destroy'
  get 'jul_dates/income', to:'jul_dates#income'
  get 'jul_dates/pay', to:'jul_dates#pay'
  post 'jul_dates/:id/update', to:'jul_dates#update'
  resources :jul_dates
  
  post 'aug_dates/create', to:'aug_dates#create'
  delete 'aug_dates/:id/destroy', to:'aug_dates#destroy'
  get 'aug_dates/income', to:'aug_dates#income'
  get 'aug_dates/pay', to:'aug_dates#pay'
  post 'aug_dates/:id/update', to:'aug_dates#update'
  resources :aug_dates
  
  post 'sep_dates/create', to:'sep_dates#create'
  delete 'sep_dates/:id/destroy', to:'sep_dates#destroy'
  get 'sep_dates/income', to:'sep_dates#income'
  get 'sep_dates/pay', to:'sep_dates#pay'
  post 'sep_dates/:id/update', to:'sep_dates#update'
  resources :sep_dates
  
  post 'oct_dates/create', to:'oct_dates#create'
  delete 'oct_dates/:id/destroy', to:'oct_dates#destroy'
  get 'oct_dates/income', to:'oct_dates#income'
  get 'oct_dates/pay', to:'oct_dates#pay'
  post 'oct_dates/:id/update', to:'oct_dates#update'
  resources :oct_dates
  
  post 'nov_dates/create', to:'nov_dates#create'
  delete 'nov_dates/:id/destroy', to:'nov_dates#destroy'
  get 'nov_dates/income', to:'nov_dates#income'
  get 'nov_dates/pay', to:'nov_dates#pay'
  post 'nov_dates/:id/update', to:'nov_dates#update'
  resources :nov_dates
  
  post 'dec_dates/create', to:'dec_dates#create'
  delete 'dec_dates/:id/destroy', to:'dec_dates#destroy'
  get 'dec_dates/income', to:'dec_dates#income'
  get 'dec_dates/pay', to:'dec_dates#pay'
  post 'dec_dates/:id/update', to:'dec_dates#update'
  resources :dec_dates
  
end