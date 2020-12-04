class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  has_many   :items
        #  has_many   :user_items
        
        VALID_NAME_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze 
        VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々]/.freeze
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

        with_options presence: true do
          validates :nickname

          validates :last_name,         format: { with: VALID_NAME}
          validates :first_name,        format: { with: VALID_NAME}
        
          validates :last_name_kana,    format: { with: VALID_NAME_KATAKANA}
          validates :first_name_kana,   format: { with: VALID_NAME_KATAKANA}


          validates :birthday

          validates :password, length: { minimum: 6, }, format: { with: VALID_PASSWORD_REGEX}
        end
end
