defmodule CaesarsCipher.Repository do
  use GenServer

  @impl true
  def init(opts), do: {:ok, opts}

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{ciphers: []}, name: __MODULE__)
  end

  @impl true
  def handle_cast(
        {:insert_encoded_cipher, %{original: _, encoded: _, cipher_offset: _} = cipher},
        state
      ) do
    {:noreply, Map.put(state, :ciphers, [cipher | state.ciphers])}
  end

  @impl true
  def handle_call(:get_ciphers, _, state) do
    {:reply, state, state}
  end
end
