require('minitest/autorun')
require('minitest/rg')
require_relative('../seller')

class  TestSeller < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'name' => 'Tesco'
    }
    @seller = Seller.new(options)
  end

  def test_seller_has_id
    assert_equal(1, @seller.id)
  end

  def test_seller_has_name
    assert_equal('Tesco', @seller.name)
  end

end
