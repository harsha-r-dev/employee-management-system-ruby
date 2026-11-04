Rails.application.routes.draw do
  root "employees#index"

  resources :employees do
    collection do
      get :search
      get :filter
      get :department_filter
      get :manager_filter
      get :joining_date_filter
    end
  end

  resources :managers
  resources :departments
end