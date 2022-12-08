class Rank < ActiveHash::Base
  include ActiveHash::Associations
  has_many :matches, dependent: :destroy

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アイアン１' },
    { id: 3, name: 'アイアン２' },
    { id: 4, name: 'アイアン３' },
    { id: 5, name: 'ブロンズ1' },
    { id: 6, name: 'ブロンズ2' },
    { id: 7, name: 'ブロンズ3' },
    { id: 8, name: 'シルバー1' },
    { id: 9, name: 'シルバー2' },
    { id: 10, name: 'シルバー3' },
    { id: 11, name: 'ゴールド１' },
    { id: 12, name: 'ゴールド2' },
    { id: 13, name: 'ゴールド３' },
    { id: 14, name: 'プラチナ1' },
    { id: 15, name: 'プラチナ２' },
    { id: 16, name: 'プラチナ３' },
    { id: 17, name: 'ダイヤモンド1' },
    { id: 18, name: 'ダイヤモンド2' },
    { id: 19, name: 'ダイヤモンド3' },
    { id: 20, name: 'アセンダント1' },
    { id: 21, name: 'アセンダント2' },
    { id: 22, name: 'アセンダント3' },
    { id: 23, name: 'イモータル1' },
    { id: 24, name: 'イモータル2' },
    { id: 25, name: 'イモータル3' },
    { id: 26, name: 'レディアント' },
  ]
end
