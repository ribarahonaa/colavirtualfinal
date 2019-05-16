class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #grupos de usuarios
  groupify :named_group_member
  groupify :group_member

  #relaciones de OperacionAtracciones
  # has_many :operaciones_atraccions
  # has_many :atraccions, through: :operaciones_atraccions
  # has_many :tickets, through: :operaciones_atraccions
end
