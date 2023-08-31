module Mutations
  class AuthorisedMutation < BaseMutation
    def ready?(**_args)
      return true if context[:current_user].present?

      raise GraphQL::ExecutionError, 'Invalid user'
    end
  end
end
