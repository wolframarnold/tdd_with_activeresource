class Person < ActiveResource::Base
  self.site   = 'http://localhost:3100'
  self.format = :json
end
