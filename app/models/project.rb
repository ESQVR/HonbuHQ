class Project < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 20 }
end
