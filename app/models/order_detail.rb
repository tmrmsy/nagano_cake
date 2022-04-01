class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

                      # 0:入金待ち, 1:入金確認, 2:製作中, 3:発送準備中, 4:発送済み
  enum making_status: { awaiting_payment: 0, payment_confirmation: 1, under_manufacture: 2, preparing_for_shipping: 3, already_shipped: 4 }

end
