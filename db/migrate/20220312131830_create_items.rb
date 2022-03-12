class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      t.integer :genre_id, null: false #ジャンルID
      t.string :name, null: false #商品名
      t.text :introduction, null: false #商品説明文
      t.integer :price, null: false #税抜き価格
      t.boolean :is_active, null: false, default: 'TRUE' #販売ステータス、デフォルトでTRUE
      t.timestamps
    end
  end
end
