Rails.application.routes.draw do
  #rutas de atraccion
  resources :atraccions
  #rutas de devise
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations", only: [:show, :edit, :update]}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ruta a index
  root to: 'usuario#index'
  #ruta a encolarse
  get 'ticket/encolar'
  get 'ticket/cambiar_estado'
  #ruta a mapa
  get 'usuario/map'
  #ruta informes
  get 'usuario/reports'
  #ruta a editar usuario para super usuario
  get 'administrador/editusers'
  get 'administrador/edit'
  get 'administrador/asignarrol'
  get 'administrador/delete_rol'
  #ruta para asignar atraccion al supervisor
  get 'administrador/supervisores'
  get 'administrador/asignar'
  get 'administrador/asignaratraccion'
  get 'administrador/eliminar'
  #ruta supervisor
  get 'supervisor/index'
  get 'supervisor/cambiar_estado'
  get 'supervisor/pausar'
  get 'supervisor/play'
  get 'supervisor/llamar'
  get 'supervisor/masivo'
end
