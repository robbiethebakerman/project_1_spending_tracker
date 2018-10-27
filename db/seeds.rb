require('pry-byebug')
require_relative('../models/category')
require_relative('../models/seller')
require_relative('../models/transaction')

Category.delete_all

category1 = Category.new({
  'name' => 'Groceries',
  'colour' => 'blue'
  })

category2 = Category.new({
  'name' => 'Pub',
  'colour' => 'red'
  })

category3 = Category.new({
  'name' => 'Vet',
  'colour' => 'green'
  })

category1.save
category2.save
category3.save

# category1.name = 'Shopping'
# category1.update
#
# category2.delete















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
