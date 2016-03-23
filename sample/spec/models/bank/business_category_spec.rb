require 'rails_helper'

RSpec.describe Bank::BusinessCategory, type: :model do
  it{
    is_expected.to validate_presence_of(:name)
    is_expected.to validate_uniqueness_of(:name)
  }

  describe "业务类别是树状的" do
    it{
      bank = Bank::BusinessCategory.create(name: "1")
      bank_1_1 = bank.children.create(:name => "1.1")
      bank_1_1_1 = bank_1_1.children.create(:name => "1.1.1")
      bank_1_1_2 = bank_1_1.children.create(:name => "1.1.2")
      bank_1_2 = bank.children.create(:name => "1.2")

      expect(Bank::BusinessCategory.roots).to eq([bank])
      expect(bank.descendants).to match_array([bank_1_1, bank_1_2, bank_1_1_1, bank_1_1_2])
    }
  end

  describe "岗位和业务类别是多对多关系" do
    it{
      expect(Bank::BusinessCategory).to have_and_belong_to_many(:enterprise_posts).of_type(EnterprisePositionLevel::Post)
      expect(EnterprisePositionLevel::Post).to have_and_belong_to_many(:business_categories).of_type(Bank::BusinessCategory)
    }
  end
end
