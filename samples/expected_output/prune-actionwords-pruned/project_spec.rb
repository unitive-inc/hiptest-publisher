# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Testing CASH WITHDRAWAL (sample N°2)' do
  include Actionwords

  context "Account has sufficient funds" do
    def account_has_sufficient_funds(amount, ending_balance)
      # Given the account balance is "$100"
      the_account_balance_is_balance("$100")
      # And the machine contains enough money
      the_machine_contains_enough_money
      # And the card is valid
      the_card_is_valid
      # When the Account Holder requests "<amount>"
      the_account_holder_requests_amount("#{amount}")
      # Then the ATM should dispense "<amount>"
      the_atm_should_dispense_amount("#{amount}")
      # And the account balance should be "<ending_balance>"
      the_account_balance_should_be_balance("#{ending_balance}")
      # And the card should be returned
      the_card_should_be_returned
    end

    it "withdraw $100" do
      account_has_sufficient_funds('$100', '$0')
    end

    it "withdraw $50" do
      account_has_sufficient_funds('$50', '$50')
    end

    it "withdraw $20" do
      account_has_sufficient_funds('$20', '$80')
    end
  end

  it "Account has insufficient funds" do
    # Given the account balance is "$10"
    the_account_balance_is_balance("$10")
    # And the card is valid
    the_card_is_valid
    # And the machine contains enough money
    the_machine_contains_enough_money
    # When the Account Holder requests "$20"
    the_account_holder_requests_amount("$20")
    # Then the ATM should not dispense any money
    the_atm_should_not_dispense_any_money
    # And the ATM should say there are insufficient funds
    the_atm_should_say_there_are_insufficient_funds
  end

  it "Card has been disabled" do
    # Given the card is disabled
    the_card_is_disabled
    # When the Account Holder requests "$10"
    the_account_holder_requests_amount("$10")
    # Then the ATM should retain the card
    the_atm_should_retain_the_card
    # And the ATM should say the card has been retained
    the_atm_should_say_the_card_has_been_retained
  end

  it "Account has sufficient funds for transferring cash" do
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
