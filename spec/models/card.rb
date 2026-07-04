require "rails_helper"

RSpec.describe Card, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cost) }
  it { should validate_presence_of(:card_type) }
  it { should validate_presence_of(:rarity) }

  it { should define_enum_for(:card_type).backed_by_column_of_type(:string).with_values({ minion: "minion", spell: "spell", weapon: "weapon", hero_power: "hero_power" }) }
  it { should define_enum_for(:rarity).backed_by_column_of_type(:string).with_values({ common: "common", uncommon: "uncommon", rare: "rare", epic: "epic", legendary: "legendary" }) }

  describe 'when card_type is minion' do
    let(:card) { build(:card, card_type: :minion) }
    it 'requires attack' do
      card.attack = nil
      expect(card).not_to be_valid
    end
    it 'requires health' do
      card.health = nil
      expect(card).not_to be_valid
    end
  end

  describe 'when card_type is spell' do
    let(:card) { build(:card, card_type: :spell) }
    it 'does not require attack nor health' do
      card.attack = nil
      card.health = nil
      expect(card).to be_valid
    end
  end

  describe 'when card_type is weapon' do
    let(:card) { build(:card, card_type: :weapon) }
    it 'requires attack' do
      card.attack = nil
      expect(card).not_to be_valid
    end

    it 'requires health' do
      card.health = nil
      expect(card).not_to be_valid
    end
  end
end
