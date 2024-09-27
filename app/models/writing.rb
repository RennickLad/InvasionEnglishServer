class Writing < ApplicationRecord
    belongs_to :user

    has_many :corrections, dependent: :destroy
end
