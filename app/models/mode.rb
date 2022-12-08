class Mode < ActiveHash::Base
  include ActiveHash::Associations
  has_many :matches, dependent: :destroy

  self.data = [
    { id: 1, name: 'コンペティティブ' },
    { id: 2, name: 'アンレート' },
    { id: 3, name: 'その他' },
  ]
end
