defmodule MediumGraphqlApiWeb.Resolvers.UserResolver do
  alias MediumGraphqlApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end
end
