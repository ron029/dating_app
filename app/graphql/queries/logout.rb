module Queries
  class Logout < Base
    type Boolean, null: false

    def resolve
      context[:session][:token] = nil
      true
    end
  end
end
