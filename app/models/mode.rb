class Mode < ActiveHash::Base
  include ActiveHash::Associations
  has_many :match_posts, dependent: :destroy

  self.data = [
    { id: 1, name: 'コンペティティブ' },
    { id: 2, name: 'アンレート' },
    { id: 2, name: 'カスタム' },
    { id: 3, name: 'その他' },
  ]
end
