defmodule CaesarsCipherApp do
  use Application

  @impl true
  def start(_type, _args) do
    Supervisor.start_link([CaesarsCipher.Repository], strategy: :one_for_one)
  end
end
