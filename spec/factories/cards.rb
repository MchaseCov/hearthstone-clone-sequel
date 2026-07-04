FactoryBot.define do
  factory :card do
    name { "CardName" }
    cost { 1 }
    card_type { "minion" }
    attack { 1 }
    health { 1 }
    effects { [] }
    rarity { "common" }
  end
end
