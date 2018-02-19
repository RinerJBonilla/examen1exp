class Location < ApplicationRecord
    has_many :recordings, dependent: :destroy
    validates :name, presence: true
end
