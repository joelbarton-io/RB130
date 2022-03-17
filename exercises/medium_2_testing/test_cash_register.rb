require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test
  def test_accept_money
    @cashr = CashRegister.new(500)
    @trans = Transaction.new(20)
    @trans.amount_paid = 20

    previous_amount = @cashr.total_money
    @cashr.accept_money(@trans)
    current_amount = @cashr.total_money

    assert_equal(previous_amount + 20, current_amount)
  end

  def test_change
    @cashr = CashRegister.new(500)
    @trans = Transaction.new(15)
    @trans.amount_paid = 20
    assert_equal(5, @cashr.change(@trans))
  end

  def test_give_receipt
    cashr = CashRegister.new(500)
    trans = Transaction.new(30)
    # trans.amount_paid = 29
    # msg = "You've paid $#{trans.amount_paid}.\n"
    # out, err = capture_io { cashr.give_receipt(trans)}
    # assert_equal(msg, out)

    assert_output("You've paid $#{30}.\n") { cashr.give_receipt(trans) }
  end
end
