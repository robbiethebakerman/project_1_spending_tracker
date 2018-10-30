require('minitest/autorun')
require('minitest/rg')
require_relative('../budget')

class TestBudget < MiniTest::Test

  def setup
    options = {
      'id' => 1,
      'type' => 'Total',
      'amount' => 450.00
    }
    @budget = Budget.new(options)
  end

  def test_budget_has_id
    assert_equal(1, @budget.id)
  end

  def test_budget_has_type
    assert_equal('Total', @budget.type)
  end

  def test_budget_has_amount
    assert_equal(450.00, @budget.amount)
  end

end
