class User < ActiveRecord::Base
  attr_accessible :email, :name,  :username,  :crypted_password, :persistence_token, :password_salt
 
  acts_as_authentic 
  
  validates :name,  :presence => true, :length =>{:minimum => 3}
  #validates  :crypted_password, :presence => true, :length =>{:minimum => 6} 
  validates_confirmation_of :password
  validates_confirmation_of :password_salt  , msg:"a palavra passe nao coincide com a inserida", if: :password 
  
  validates_presence_of :password_confirmation, :if => :password_changed?
  
  has_many :microposts
  
end

