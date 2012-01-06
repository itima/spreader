module UsersHelper
  
  def connect_or_view_account(account_id)
    if Delayed::Backend::Mongoid::Job.all(conditions: {handler: Regexp.new(account_id, true), handler: Regexp.new(current_user.uid, true)}).count > 0
      'Retrieval in progress'
    else
      if account = Account.first(conditions: {:uid => account_id})
        result = "(#{account.retrieval_status}, Last update: #{account.retrieval_date}) "
        result += link_to 'View', account 
        result += " | "
        result += link_to 'Sync', accounts_sync_path(account_id)
        raw result
      else
        link_to 'Connect', accounts_retrieve_path(account_id)
      end
    end
  end
  
end