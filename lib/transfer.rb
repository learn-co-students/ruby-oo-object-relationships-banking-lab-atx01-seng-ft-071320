require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  def valid?
    self.sender.valid? && self.receiver.valid? 
  end 
     

  def rejected
    #binding.pry
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    #binding.pry
    if valid? && sender.balance > amount && self.status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      rejected
    end
  end

  #binding.pry

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status =='complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    else
      rejected
    end
  end 
end
