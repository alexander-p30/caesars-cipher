defmodule CaesarsCipher do
  @moduledoc """
  Documentation for `CaesarsCipher`.
  """

  alias CaesarsCipher.{Encoder, Repository}

  def encode(message, cipher_offset) do
    message
    |> Encoder.perform(cipher_offset)
    |> build_repository_message(message, cipher_offset)
    |> send_message_to_repository()
  end

  def decode(message, cipher_offset) do
    message
    |> Encoder.perform(0 - cipher_offset)
    |> build_repository_message(message, cipher_offset)
    |> send_message_to_repository()
  end

  defp build_repository_message(result, message, cipher_offset) do
    {:insert_encoded_cipher,
        %{original: message, encoded: result, cipher_offset: cipher_offset}}
  end

  defp send_message_to_repository({_, %{encoded: result}} = message) do
    GenServer.cast(Repository, message)
    result
  end
end
