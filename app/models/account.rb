require 'koala'
class Account
  include Mongoid::Document

  field :uid, :type => String
  field :account_id, :type => Integer
  field :name, :type => String
  field :account_status, :type => Integer
  field :currency, :type => String
  field :timezone_id, :type => Integer
  field :timezone_name, :type => String
  field :is_personal, :type => Integer
  field :business_name, :type => String
  field :business_street, :type => String
  field :business_street2, :type => String
  field :business_city, :type => String
  field :business_state, :type => String
  field :business_zip, :type => String
  field :business_country_code, :type => String
  field :vat_status, :type => Integer
  field :daily_spend_limit, :type => Integer
  field :balance, :type => Integer
  
  field :retrieval_status, :type => String
  field :retrieval_date, :type => Time
  
  belongs_to :user
  has_many :campaigns

  def self.retrieve(account_id, user)  
    graph = Koala::Facebook::API.new(user.token)
    account = graph.get_object(account_id)
    
    # TODO: retrieve account
    account['uid'] = account['id']
    account.delete('id')
    account.delete('users')
    account.delete('capabilities')
    account = Account.new account
    account.user = user
    account.save
    Rails.logger.debug { "Account: #{account.inspect}" }
    
    # TODO: retrieve creatives
    adcreatives = graph.get_connections(account_id, 'adcreatives')
    
    adcreatives.each do |adcreative|
      creative = Creative.build_from(adcreative, account)
      creative.user = user
      creative.save
      Rails.logger.debug { "Creative: #{creative.inspect}" }
    end
    
    # TODO: retrieve campaigns
    adcampaigns = graph.get_connections(account_id, 'adcampaigns')
    
    adcampaigns.each do |adcampaign|
      campaign = Campaign.build_from(adcampaign, account)
      campaign.user = user
      campaign.save
      Rails.logger.debug { "Campaign: #{campaign.inspect}" }
    end
    
    # TODO: retrieve adgroups
    adgroups = graph.get_connections(account_id, 'adgroups')
    
    adgroups.each do |adgroup|
      adgroup = Adgroup.build_from(adgroup, user)
      adgroup.save
      Rails.logger.debug { "Adgroup: #{adgroup.inspect}" }
    end
        
    account
  end
  
end
