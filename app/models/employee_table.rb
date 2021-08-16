class EmployeeTable < ApplicationRecord
  validates :name, presence: true
  validates :department, presence: true
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :salary, presence: true
end
