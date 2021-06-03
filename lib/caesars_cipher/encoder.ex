defmodule CaesarsCipher.Encoder do
  @max_offset 26

  def perform(message, cipher_offset) do
    message
    |> String.to_charlist()
    |> Enum.map(&encode_character(&1, cipher_offset))
    |> to_string
  end

  defp encode_character(char_number, cipher_offset)
       when char_number in ?A..?Z or char_number in ?a..?z do
    char_number + normalize_offset(char_number, cipher_offset)
  end

  defp encode_character(char_number, _cipher_offset) do
    char_number
  end

  defp normalize_offset(char_number, cipher_offset)
       when (char_number in ?a..?z and char_number + cipher_offset < ?a) or
              (char_number in ?A..?Z and char_number + cipher_offset < ?A) do
    normalize_offset(char_number, cipher_offset + @max_offset)
  end

  defp normalize_offset(char_number, cipher_offset)
       when (char_number in ?a..?z and char_number + cipher_offset > ?z) or
              (char_number in ?A..?Z and char_number + cipher_offset > ?Z) do
    normalize_offset(char_number, cipher_offset - @max_offset)
  end

  defp normalize_offset(_char_number, cipher_offset),
    do: rem(cipher_offset, @max_offset)
end
