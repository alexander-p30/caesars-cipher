defmodule CeasarsCipher do
  @moduledoc """
  Documentation for `CeasarsCipher`.
  """

  @first_upper_letter_code 65
  @last_upper_letter_code 90
  @first_lower_letter_code 97
  @last_lower_letter_code 122

  defmacro first_upper_letter_code, do: @first_upper_letter_code

  defmacro last_upper_letter_code, do: @last_lower_letter_code

  defmacro first_lower_letter_code, do: @first_lower_letter_code

  defmacro last_lower_letter_code, do: @last_lower_letter_code

  # Adding one is necessary to account for all alphabet letters
  defmacro max_cipher_offset, do: @last_upper_letter_code - @first_upper_letter_code + 1

  def normalize_offset(cipher_offset) when cipher_offset <= 0,
    do: normalize_offset(cipher_offset + max_cipher_offset())

  def normalize_offset(cipher_offset),
    do: cipher_offset |> rem(max_cipher_offset())
end
