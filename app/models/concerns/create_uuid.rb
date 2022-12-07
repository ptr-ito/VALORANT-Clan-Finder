module CreateUuid
  extend ActiveSupport::Concern

  def self.included(klass)
    klass.before_create :fill_uuid
  end

  def fill_uuid
    self.uuid = loop do
      uuid = SecureRandom.uuid
      break uuid unless self.class.exists?(id: uuid)
    end
  end
end