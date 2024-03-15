class Arret < ApplicationRecord
    validates :name, presence: true
    validates :year, presence: true
    validates :apport, presence: true
end
