class Rank < ActiveHash::Base
  include ActiveHash::Associations
  has_many :match_posts, dependent: :destroy

  self.data = [
    { id: 1, name: '特になし' },
    { id: 2, name: 'わいわいやりたい' },
    { id: 3, name: '楽しみながら勝ちにいきたい' },
    { id: 4, name: '勝ちにいきたい' },
  ]
end