class Creative
  include Mongoid::Document
  field :creative_id, :type => String
  field :type, :type => Integer
  field :title, :type => String
  field :body, :type => String
  field :image_hash, :type => String
  field :link_url, :type => String
  field :object_id, :type => Integer
  field :name, :type => String
  field :run_status, :type => Integer
  field :preview_url, :type => String
  field :count_current_adgroups, :type => Integer
  field :uid, :type => String
  field :image_url, :type => String

  field :retrieval_status, :type => String
  field :retrieval_date, :type => Time
  
  has_many :adgroups
  belongs_to :user  
  belongs_to :account
  
  def self.build_from (adcreative, account)
    adcreative['uid'] = adcreative['id']
    adcreative.delete('id')
    
    creative = Creative.new(adcreative)
    creative.account = account
    
    creative
  end
  
end
