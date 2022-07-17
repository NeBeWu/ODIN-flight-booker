class Flight < ApplicationRecord
  belongs_to :departure
  belongs_to :arrival
end
