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
  
end
