defmodule CeasarsCipher.Encoder do
  @first_upper 65
  @last_upper 90
  @first_lower 97
  @last_lower 122
  @max_offset 26

  def perform(message, cipher_offset) do
    message |> String.to_charlist() |> Enum.map(&encode_character(&1, cipher_offset)) |> to_string
  end

  defp encode_character(char_number, cipher_offset)
       when char_number in @first_upper..@last_upper or
              char_number in @first_lower..@last_lower do
    char_number + normalize_offset(char_number, cipher_offset)
  end

  defp encode_character(char_number, _cipher_offset) do
    char_number
  end

  defp normalize_offset(char_number, cipher_offset)
       when (char_number in @first_lower..@last_lower and
               char_number + cipher_offset < @first_lower) or
              (char_number in @first_upper..@last_upper and
                 char_number + cipher_offset < @first_upper) do
    normalize_offset(char_number, cipher_offset + @max_offset)
  end

  defp normalize_offset(char_number, cipher_offset)
       when (char_number in @first_lower..@last_lower and
               char_number + cipher_offset > @last_lower) or
              (char_number in @first_upper..@last_upper and
                 char_number + cipher_offset > @last_upper) do
    normalize_offset(char_number, cipher_offset - @max_offset)
  end

  defp normalize_offset(_char_number, cipher_offset),
    do: rem(cipher_offset, @max_offset)
end
