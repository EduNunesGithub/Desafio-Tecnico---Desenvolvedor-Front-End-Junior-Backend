class Vehicle < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Permitir que Ransack use apenas os atributos especificados para busca
  def self.ransackable_attributes(auth_object = nil)
    %w[name price created_at updated_at]
  end
end
