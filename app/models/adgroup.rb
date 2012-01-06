class Adgroup
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :adgroup_id, :type => Integer
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

  field :retrieval_status, :type => String
  field :retrieval_date, :type => Time
  
  belongs_to :campaign
  belongs_to :creative
  belongs_to :user
  
  
  def self.build_from (adgroup, user)
    adgroup['uid'] = adgroup['id']
    adgroup.delete('id')
    
    campaign = Campaign.where(campaign_id: adgroup['campaign_id'])
    creative = Creative.where(creative_id: adgroup['creative_ids'].first)
    
    adgroup = Adgroup.find_or_initialize_by(adgroup)
    adgroup.campaign = ''#campaign
    adgroup.creative = ''#creative
    adgroup.user = user
    
    adgroup
  end
  
end
