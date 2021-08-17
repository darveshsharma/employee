class EmployeeTable < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :department, presence: true
  validates :email, presence: true, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :salary, presence: true, numericality: {only_integer: true }
end
