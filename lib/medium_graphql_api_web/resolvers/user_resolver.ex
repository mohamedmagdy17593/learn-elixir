defmodule MediumGraphqlApiWeb.Resolvers.UserResolver do
  alias MediumGraphqlApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end

  def register_user(_, %{input: user}, _) do
    Accounts.create_user(user)
  end

  def login_user(_, _, _) do
    {:ok, %{token: "", user: Accounts.get_user!(1)}}
  end
end
