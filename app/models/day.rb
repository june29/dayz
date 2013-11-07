class Day < ActiveRecord::Base
  def to_param
    self.date.to_s
  end
end
