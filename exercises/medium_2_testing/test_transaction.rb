require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    trans = Transaction.new(30)
    input = StringIO.new("30\n")
    trans.prompt_for_payment(input: input)
  end
end
