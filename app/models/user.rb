class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def stock_already_tracked?(sym)
    stocks.where(ticker: sym).exists?
    #stock = Stock.check_db(sym)
    #return false unless stock
  end       

  def under_stock_limit?
    stocks.count < 10
  end

  def can_track_stock?(sym)
    under_stock_limit? && !stock_already_tracked?(sym)
  end  
end
