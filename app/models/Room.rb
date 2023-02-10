class Room < ApplicationRecord
    has_many :messages
    validates_uniqueness_of :name, message: "must be unique"
end