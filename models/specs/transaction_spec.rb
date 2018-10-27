require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')

class TestTransaction < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'seller_id' =>2,
      'category_id' => 3,
      'amount' => 10.50,
      'transaction_time' => '2018-11-23 09:35:00',
      'description' => 'Vet bills for Madge'
    }
    @transaction = Transaction.new(options)
  end

  def test_transaction_has_id
    assert_equal(1, @transaction.id)
  end

  def test_transaction_has_seller_id
    assert_equal(2, @transaction.seller_id)
  end

  def test_transaction_has_category_id
    assert_equal(3, @transaction.category_id)
  end

  def test_transaction_has_amount
    assert_equal(10.50, @transaction.amount)
  end

  def test_transaction_has_transaction_time
    assert_equal('2018-11-23 09:35:00', @transaction.transaction_time)
  end

  def test_transaction_has_description
    assert_equal('Vet bills for Madge', @transaction.description)
  end

end
