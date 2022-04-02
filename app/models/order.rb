class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum order_status: { awaiting_payment: 0, payment_confirmation: 1, under_manufacture: 2, preparing_for_shipping: 3, already_shipped: 4 }

  def shipping_address_display
    '〒' + shipping_postal_code + ' ' + shipping_address + ' ' + shipping_name
  end

end
