class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id, null: false #会員ID
      t.string :shipping_postal_code, null: false #配送先郵便番号
      t.string :shipping_address, null: false #配送先住所
      t.string :shipping_name, null: false #配送先氏名
      t.integer :postage, null: false #送料
      t.integer :amount_billed, null: false #請求額
      t.integer :payment_method, null: false, default: "0" #支払方法　enumで管理　デフォルトで０
      t.integer :order_status, null: false, default: "0" #受注ステータス enumで管理　デフォルトで

      t.timestamps
    end
  end
end
