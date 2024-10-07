Rails.application.routes.draw do
  root 'moments#index' # Устанавливаем главную страницу для отображения списка моментов
  resources :moments, only: [:index, :show]
end
