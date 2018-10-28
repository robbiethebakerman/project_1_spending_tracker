require('pry-byebug')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

Transaction.delete_all
Category.delete_all
Seller.delete_all

category_none = Category.new({
  'id' => '1000000',
  'name' => 'None'
  })

category_none.save

category2 = Category.new({
  'name' => 'Groceries',
  'colour' => 'blue'
  })

category3 = Category.new({
  'name' => 'Pub',
  'colour' => 'red'
  })

category1 = Category.new({
  'name' => 'Vet'
  })

category1.save
category2.save
category3.save

seller1 = Seller.new({
  'name' => 'Tesco'
  })

seller2 = Seller.new({
  'name' => 'The Tenement'
  })

seller3 = Seller.new({
  'name' => "Anderson's Veterinary Clinic"
  })

seller1.save
seller2.save
seller3.save

transaction1 = Transaction.new({
  'seller_id' => seller2.id,
  'category_id' => category2.id,
  'amount' => 11.24,
  'transaction_time' => '23-Sep-2018 13:21:00',
  'description' => 'Round for the bridge team'
  })

transaction2 = Transaction.new({
  'seller_id' => seller3.id,
  'category_id' => category3.id,
  'amount' => 1199.99,
  'transaction_time' => '2018-09-13 15:45:00',
  'description' => "Rex's leg operation"
  })

transaction1.save
transaction2.save












#
# binding.pry
# nil

# INSERT INTO sellers (name)
#   VALUES ('Tesco');
#
# INSERT INTO categories (name, colour)
#   VALUES ('Groceries', 'Blue');
#
# INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description)
#   VALUES (1, 1, 22.70, '2018-10-27 16:54:00', 'Food for dinner');
#
# INSERT INTO transactions (seller_id, category_id, amount, transaction_time, description)
#   VALUES (1, 1, 22.70, 'now', 'Food for dinner')
