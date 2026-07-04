class Card < ApplicationRecord
  enum :card_type, { minion: "minion", spell: "spell", weapon: "weapon", hero_power: "hero_power" }
  enum :rarity, { common: "common", uncommon: "uncommon", rare: "rare", epic: "epic", legendary: "legendary" }

  validates :name, presence: true
  validates :cost, presence: true
  validates :card_type, presence: true
  validates :attack, presence: true, if: -> { minion? || weapon? }
  validates :health, presence: true, if: -> { minion? || weapon? }
  validates :rarity, presence: true
end
