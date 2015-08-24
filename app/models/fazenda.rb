class Fazenda < ActiveRecord::Base
  validates :nome, uniqueness: true
  has_many :lotes
end
