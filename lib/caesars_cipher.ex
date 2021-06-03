defmodule CaesarsCipher do
  @moduledoc """
  Documentation for `CaesarsCipher`.
  """

  def encode(message, cipher_offset) do
    result = CaesarsCipher.Encoder.perform(message, cipher_offset)

    cast_message =
      {:insert_encoded_cipher,
       %{original: message, encoded: result, cipher_offset: cipher_offset}}

    GenServer.cast(CaesarsCipher.Repository, cast_message)
    result
  end

  def decode(message, cipher_offset) do
    result = CaesarsCipher.Encoder.perform(message, 0 - cipher_offset)

    cast_message =
      {:insert_encoded_cipher,
       %{original: result, encoded: message, cipher_offset: cipher_offset}}

    GenServer.cast(CaesarsCipher.Repository, cast_message)
    result
  end
end
