class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table "buyers", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.text "address"
      t.bigint "phone"
    end
    
    create_table "farmers", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.string "password_digest"
      t.text "address"
      t.bigint "phone"
    end
    
    create_table "items", force: :cascade do |t|
      t.string "name"
      t.string "type"
      t.integer "quantity"
      t.bigint "farmer_id"
      t.integer "price_per_kilo"
    end
    
    create_table "cart_items", force: :cascade do |t|
      t.bigint "item_id"
      t.integer "quantity"
      t.bigint "buyer_id"
    end

    create_table "orders", force: :cascade do |t|
      t.bigint "buyer_id"
    end

    create_table "order_items", force: :cascade do |t|
      t.bigint "buyer_id"
      t.string "name"
      t.string "type"
      t.integer "quantity"
      t.integer "price_per_kilo"
      t.integer "total_price"
      t.bigint "farmer_id"
    end
  end
end
