class User < ApplicationRecord
  has_many :transactions
  has_many :bills
  has_many :budgets

  def total_spend
    Transaction.where(user_id: self.id).sum(:amount)
  end
end
