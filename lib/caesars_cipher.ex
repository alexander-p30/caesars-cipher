defmodule CaesarsCipher do
  @moduledoc """
  Documentation for `CaesarsCipher`.
  """

  def encode(message, cipher_offset),
    do: CaesarsCipher.Encoder.perform(message, cipher_offset)

  def decode(message, cipher_offset),
    do: CaesarsCipher.Encoder.perform(message, 0 - cipher_offset)
end
