class Adgroup
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :advert_id, :type => Integer
  field :ad_id, :type => Integer
  field :campaign_id, :type => Integer
  field :name, :type => String
  field :ad_status, :type => Integer
  field :adgroup_status, :type => Integer
  field :bid_type, :type => Integer
  field :max_bid, :type => Integer
  field :bid_info, :type => Hash
  field :account_id, :type => Integer
  field :uid, :type => String
  field :creative_ids, :type => Array
  field :targeting, :type => Hash
  field :start_time, :type => Time
  field :end_time, :type => Time
  
  belongs_to :campaign
  has_one :creative
  
end
