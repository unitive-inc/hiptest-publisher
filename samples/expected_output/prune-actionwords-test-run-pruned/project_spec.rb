# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Testing CASH WITHDRAWAL (sample N°2)' do
  include Actionwords

  it "Account has sufficient funds for transferring cash (uid:b71c1431-06ff-453f-8e59-341e599164ea)" do
    # Given the account balance is "$100"
    the_account_balance_is_balance("$100")
    # And the savings account balance is "$1000"
    the_savings_account_balance_is_amount("$1000")
    # And the card is valid
    the_card_is_valid
    # When the Account Holder transfers "$20" to the savings account
    the_account_holder_transfers_amount_to_the_savings_account("$20")
    # And the ATM should dispense "$0"
    the_atm_should_dispense_amount("$0")
    # And the account balance is "$80"
    the_account_balance_is_balance("$80")
    # And the savings account balance should be "$1020"
    the_savings_account_balance_should_be_amount("$1020")
    # And the card should be returned
    the_card_should_be_returned
  end
end
