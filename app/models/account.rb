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
  
  STATUS = [:complete, :unfinished, :error]
  
  belongs_to :user
  has_many :campaigns

  def self.retrieve(account_id, user)  
    begin
      graph = Koala::Facebook::API.new(user.token)
      adaccount = graph.get_object(account_id)
    
      # TODO: retrieve account
      adaccount['uid'] = adaccount['id']
      adaccount.delete('id')
      adaccount.delete('users')
      adaccount.delete('capabilities')

      account = Account.find_or_initialize_by adaccount
      account.user = user
      account.retrieval_date = DateTime.now
      account.retrieval_status = :unfinished
      account.save
      Rails.logger.debug { "Account: #{account.inspect}" }
    
      # TODO: retrieve creatives
      adcreatives = graph.get_connections(account_id, 'adcreatives')
    
      adcreatives.each do |adcreative|
        begin
          creative = Creative.build_from(adcreative, account)
          creative.user = user
          creative.retrieval_date = DateTime.now
          creative.retrieval_status = :complete
          creative.save
          Rails.logger.debug { "Creative: #{creative.inspect}" }
        rescue
          creative.retrieval_status = :error
          logger.error { "Couldn't retrieve creative: #{adcreative.inspect}" }
        end
      end
    
      # TODO: retrieve campaigns
      adcampaigns = graph.get_connections(account_id, 'adcampaigns')

      adcampaigns.each do |adcampaign|
        begin
          campaign = Campaign.build_from(adcampaign, account)
          campaign.user = user
          campaign.retrieval_date = DateTime.now
          campaign.retrieval_status = :complete
          campaign.save
          Rails.logger.debug { "Campaign: #{campaign.inspect}" }
        rescue 
          campaign.retrieval_status = :error
          logger.error { "Couldn't retrieve creative: #{adcampaign.inspect}" }
        end
      end
      
    
      # TODO: retrieve adgroups
      adgroups = graph.get_connections(account_id, 'adgroups')
    
      adgroups.each do |adgroup|
        begin
        add = Adgroup.build_from(adgroup, user)
        add.retrieval_date = DateTime.now
        add.retrieval_status = :complete
        add.save
        Rails.logger.debug { "Adgroup: #{add.inspect}" }
        rescue 
          add.retrieval_status = :error
          logger.error { "Couldn't retrieve adgroup: #{adgroup.inspect}" }
        end
      end
    
      account.retrieval_status = :complete
      account.save

      RetrievalNotifier.success(user, account).deliver

      account
    
    rescue Exception => e 
      if !!account
        account.retrieval_status = :error
        account.save
      end
      RetrievalNotifier.failure(user, account_id, e).deliver
      Rails.logger.error { "Error saving account or some sub items. #{account_id}" }
      logger.error { "Exception: #{e.inspect}" }
      nil
    end
  end
  
end
