defmodule MediumGraphqlApiWeb.Resolvers.UserResolver do
  alias MediumGraphqlApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def register_user(_, %{input: user}, _) do
    IO.inspect(user)
    IO.inspect(Accounts.create_user(user))
  end
end
