class User
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  field :token, :type => String
  
  has_many :accounts
  has_many :campaigns
  has_many :adgroups
  has_many :creatives
  
  attr_accessible :provider, :uid, :name, :email, :token

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
      if auth['credentials']
        user.token = auth['credentials']['token'] || ""
      end
    end
  end

end

