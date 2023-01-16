class HighestRank < ActiveHash::Base
  include ActiveHash::Associations
  has_many :users, dependent: :destroys

  self.data = [
    { id: 1, name: '未選択' },
    { id: 2, name: 'ランクなし' },
    { id: 3, name: 'アイアン１' },
    { id: 4, name: 'アイアン２' },
    { id: 5, name: 'アイアン３' },
    { id: 6, name: 'ブロンズ1' },
    { id: 7, name: 'ブロンズ2' },
    { id: 8, name: 'ブロンズ3' },
    { id: 9, name: 'シルバー1' },
    { id: 10, name: 'シルバー2' },
    { id: 11, name: 'シルバー3' },
    { id: 12, name: 'ゴールド１' },
    { id: 13, name: 'ゴールド2' },
    { id: 14, name: 'ゴールド３' },
    { id: 15, name: 'プラチナ1' },
    { id: 16, name: 'プラチナ２' },
    { id: 17, name: 'プラチナ３' },
    { id: 18, name: 'ダイヤモンド1' },
    { id: 19, name: 'ダイヤモンド2' },
    { id: 20, name: 'ダイヤモンド3' },
    { id: 21, name: 'アセンダント1' },
    { id: 22, name: 'アセンダント2' },
    { id: 23, name: 'アセンダント3' },
    { id: 24, name: 'イモータル1' },
    { id: 25, name: 'イモータル2' },
    { id: 26, name: 'イモータル3' },
    { id: 27, name: 'レディアント' },
  ]
end
