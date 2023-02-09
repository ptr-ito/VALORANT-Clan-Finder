class HighestRank < ActiveHash::Base
  include ActiveHash::Associations
  has_many :users, dependent: :destroys

  self.data = [
    { id: 99, name: '未選択' },
    { id: 0, name: 'ランクなし' },
    { id: 10, name: 'アイアン１' },
    { id: 11, name: 'アイアン２' },
    { id: 12, name: 'アイアン３' },
    { id: 20, name: 'ブロンズ1' },
    { id: 21, name: 'ブロンズ2' },
    { id: 22, name: 'ブロンズ3' },
    { id: 30, name: 'シルバー1' },
    { id: 31, name: 'シルバー2' },
    { id: 32, name: 'シルバー3' },
    { id: 40, name: 'ゴールド１' },
    { id: 41, name: 'ゴールド2' },
    { id: 42, name: 'ゴールド３' },
    { id: 50, name: 'プラチナ1' },
    { id: 51, name: 'プラチナ２' },
    { id: 52, name: 'プラチナ３' },
    { id: 60, name: 'ダイヤモンド1' },
    { id: 61, name: 'ダイヤモンド2' },
    { id: 62, name: 'ダイヤモンド3' },
    { id: 70, name: 'アセンダント1' },
    { id: 71, name: 'アセンダント2' },
    { id: 72, name: 'アセンダント3' },
    { id: 80, name: 'イモータル1' },
    { id: 81, name: 'イモータル2' },
    { id: 82, name: 'イモータル3' },
    { id: 90, name: 'レディアント' },
  ]
end
