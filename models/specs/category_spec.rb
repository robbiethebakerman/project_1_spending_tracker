require('minitest/autorun')
require('minitest/rg')
require_relative('../category')

class  TestCategory < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'name' => 'Groceries',
      'colour' => 'Blue'
    }
    @category = Category.new(options)
  end

  def test_category_has_id
    assert_equal(1, @category.id)
  end

  def test_category_has_name
    assert_equal('Groceries', @category.name)
  end

  def test_category_has_colour
    assert_equal('Blue', @category.colour)
  end

end
