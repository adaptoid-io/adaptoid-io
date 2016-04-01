class BaseDecorator < SimpleDelegator
  alias_method :model, :__getobj__
end
