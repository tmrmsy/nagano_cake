class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 } # 0:クレジットカード, 1:銀行振込

                      # 0:入金待ち, 1:入金確認, 2:製作中, 3:発送準備中, 4:発送済み
  enum order_status: { awaiting_payment: 0, payment_confirmation: 1, under_manufacture: 2, preparing_for_shipping: 3, already_shipped: 4 }

  def shipping_address_display
    '〒' + shipping_postal_code + ' ' + shipping_address + ' ' + shipping_name
  end
end
