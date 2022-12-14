class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  acts_as_token_authenticatable
  has_one :charity, dependent: :destroy
  has_many :campaigns, through: :charity, dependent: :destroy
end

