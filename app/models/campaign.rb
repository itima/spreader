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

  field :retrieval_status, :type => String
  field :retrieval_date, :type => Time
  
  belongs_to :account
  belongs_to :user  
  has_many :adgroups
  
  def self.build_from (adcampaign, account)
    adcampaign['uid'] = adcampaign['id']
    adcampaign.delete('id')
    
    campaign = Campaign.new(adcampaign)
    campaign.account = account
    
    campaign
  end
  
end
