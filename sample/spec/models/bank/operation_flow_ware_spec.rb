require 'rails_helper'

RSpec.describe Bank::OperationFlowWare, type: :model do
  describe "业务种类和操作流程课件是一对多的关系" do
    it{
      expect(Bank::BusinessCategory).to have_many(:operation_flow_wares).of_type(Bank::OperationFlowWare)
      expect(Bank::OperationFlowWare).to belong_to(:business_category).of_type(Bank::BusinessCategory)
    }
  end
end
