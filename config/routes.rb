Rails.application.routes.draw do
#devise_for :customers
# ユーザー用
# URL /customers/sign_in ...
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
scope module: :public do
  root 'homes#top'

  get 'users/mypage' => 'users#show', as: 'mypage'
  # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
  get 'users/information/edit' => 'users#edit', as: 'edit_information'
  patch 'users/information' => 'users#update', as: 'update_information'

  resources :hobbies
end
  resources :genres, only: [:index, :create, :edit, :update]

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
end