class Stockpile < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :projects
end
