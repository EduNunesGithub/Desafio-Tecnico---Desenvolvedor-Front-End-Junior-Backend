class Company < ApplicationRecord
  before_save :format_phone, :format_whatsapp

  validates :company_name, presence: true
  validates :phone, presence: true, length: {  maximum: 15 }
  validates :whatsapp, presence: true, length: {  maximum: 15 }

  # Permitir que Ransack use apenas os atributos especificados para busca
  def self.ransackable_attributes(auth_object = nil)
    %w[company_name cnpj address phone whatsapp created_at updated_at]
  end

  private

  def format_phone
    self.phone = format_number(phone)
  end

  def format_whatsapp
    self.whatsapp = format_number(whatsapp)
  end

  def format_number(number)
    digits = number.gsub(/\D/, '')

    if digits.length == 11
      digits.gsub(/^(\d{2})(\d{5})(\d{4})$/, '(\1) \2-\3')
    elsif digits.length == 10
      digits.gsub(/^(\d{2})(\d{4})(\d{4})$/, '(\1) \2-\3')
    else
      digits
    end
  end
end
