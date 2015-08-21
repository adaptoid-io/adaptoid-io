class ServiceCall
  attr_accessor :data, :errors

  def initialize(data = nil, errors = nil)
    @data = data
    @errors = *errors || []
  end

  def success?
    errors.empty?
  end
end
