defmodule CeasarsCipher.Encoder do
  import CeasarsCipher

  def start(message, cipher_offset) do
    cipher_offset = cipher_offset |> normalize_offset()
    message |> String.to_charlist() |> Enum.map(&encode_character(&1, cipher_offset)) |> to_string
  end

  defp encode_character(char_number, cipher_offset)
       when char_number in first_upper_letter_code()..last_upper_letter_code() or
              char_number in first_lower_letter_code()..last_lower_letter_code() do
    IO.puts("#{char_number} + #{cipher_offset} = #{char_number + cipher_offset}")
    char_number + cipher_offset
  end

  defp encode_character(char_number, _cipher_offset) do
    char_number
  end
end
