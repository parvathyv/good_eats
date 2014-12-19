class Restaurant < ActiveRecord::Base
  
  has_many :reviews, :dependent => :destroy

  validates :name, presence: true, uniqueness: true 
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { within:["AL", "AK", "AS","AZ","AR","CA","CO","CT","DE","DC","FM","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA", 
	"ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ",
	"NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VI","VA","WA",
	"WV","WI","WY"],
    message: "must be real" }
  validates :zip,  presence: true, format: {with: /\A\d{5}(-\d{4})?\Z/, message: "Incorrect format"}  

 
end