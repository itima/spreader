class Campaign
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :account_id, :type => String
  field :campaign_id, :type => String
  field :name, :type => String
  field :daily_budget, :type => Integer
  field :campaign_status, :type => Integer
  field :daily_imps, :type => Integer
  field :uid, :type => Integer
  field :start_time, :type => Time
  field :end_time, :type => Time
  
  belongs_to :account
  has_many :adgroups
end
