require 'pry'

class BankAccount

  attr_accessor :balance, :status

  @@all = []

  def initialize (name)
    @name = name
    @balance = 1000
    @status = "open"
    self.class.all << self
  end

  def self.all
    @@all
  end

  def name
    @name
  end

  def deposit (amount)
    @balance += amount
  end

  def display_balance
    money = balance
    "Your balance is $#{money}."
  end

  def valid?
    if status == "open" && balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end
