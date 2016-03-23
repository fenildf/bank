module Bank
  class OperationFlowWare < KcCourses::Ware
    # KcCourses::Ware 已经有 title desc 字段

    field :number, type: String
    field :actions

    belongs_to :business_category, class_name: "Bank::BusinessCategory"
  end
end
