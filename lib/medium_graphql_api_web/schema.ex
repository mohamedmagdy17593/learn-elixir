defmodule MediumGraphqlApiWeb.Schema do
  use Absinthe.Schema

  alias MediumGraphqlApiWeb.Resolvers

  import_types(MediumGraphqlApiWeb.Schema.UserType)
  import_types(MediumGraphqlApiWeb.Schema.SessionType)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "regester a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "Login a user and generate a jwt tokent"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.UserResolver.login_user/3)
    end
  end
end
