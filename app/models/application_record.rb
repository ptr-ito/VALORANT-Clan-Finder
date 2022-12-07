class ApplicationRecord < ActiveRecord::Base
  include CreateUuid
  primary_abstract_class
end
