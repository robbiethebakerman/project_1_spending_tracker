require('pry-byebug')
require_relative('../models/category')
require_relative('../models/seller')
# require_relative('../models/transaction')

Category.delete_all
Seller.delete_all

category1 = Category.new({
  'name' => 'Groceries',
  'colour' => 'blue'
  })

category2 = Category.new({
  'name' => 'Pub',
  'colour' => 'red'
  })

category3 = Category.new({
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















binding.pry
nil

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
