class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many   :items
         has_many   :user_items
       

         validates :nickname,         presence: true

         VALID_LAST_NAME =/\A[ぁ-んァ-ン一-龥]/.freeze
         validates :last_name,        presence: true, format: { with: VALID_LAST_NAME}

         VALID_FIRST_NAME =/\A[ぁ-んァ-ン一-龥]/.freeze
         validates :first_name,       presence: true, format: { with: VALID_FIRST_NAME}
        
         VALID_LAST_NAME_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
         validates :last_name_kana,   presence: true, format: { with: VALID_LAST_NAME_KATAKANA}

         VALID_FIRST_NAME_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
         validates :first_name_kana,  presence: true, format: { with: VALID_FIRST_NAME_KATAKANA}


         validates :birthday,         presence: true


         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, presence: true, length: { minimum: 6, }, format: { with: VALID_PASSWORD_REGEX}

end
