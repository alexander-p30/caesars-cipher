defmodule CeasarsCipher do
  @moduledoc """
  Documentation for `CeasarsCipher`.
  """

  def encode(message, cipher_offset),
    do: CeasarsCipher.Encoder.perform(message, cipher_offset)

  def decode(message, cipher_offset),
    do: CeasarsCipher.Encoder.perform(message, 0 - cipher_offset)
end
