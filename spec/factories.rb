Factory.define :user do |user|
  user.provider               'facenook'
  user.name                   "Joe Bloggs"
  user.email                  "joe@bloggs.com"
  user.uid                    '1234567'
  user.token                  'ABCDEF...'
end