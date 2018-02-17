class CreditCard < ApplicationRecord
  belongs_to :user
  #### METHODS
  def get_name
    return "#{self.issuer} #{self.kind}"
  end
  #### CLASS METHODS
  def self.get_all
    cc = []
    CreditCard.all.each do |c|
      cc << [c.get_name, c.id]
    end #each_do
    return cc
  end #get_all
end
