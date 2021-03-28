defmodule CaesarsCipherTest do
  use ExUnit.Case
  import CaesarsCipher
  doctest CaesarsCipher

  describe "start" do
    tests = [
      {"A", 0, "A"},
      {"A", 1, "B"},
      {"A", 3, "D"},
      {"A", 26, "A"},
      {"A", 27, "B"},
      {"A", 52, "A"},
      {"A", -1, "Z"},
      {"Z", 1, "A"},
      {"Y", 2, "A"},
      {"B", -1, "A"},
      {"a", 0, "a"},
      {"a", 1, "b"},
      {"a", 3, "d"},
      {"a", 26, "a"},
      {"a", 27, "b"},
      {"a", 52, "a"},
      {"a", -1, "z"},
      {"b", -1, "a"}
    ]

    for {char, offset, result} <- tests do
      test "correctly encodes character '#{char}' when offset is #{offset}" do
        assert encode(unquote(char), unquote(offset)) == unquote(result)
      end
    end

    for {result, offset, char} <- tests do
      test "correctly decodes character '#{char}' when applied offset was #{offset}" do
        assert decode(unquote(char), unquote(offset)) == unquote(result)
      end
    end

    tests = [
      {"Abcde ab", 0, "Abcde ab"},
      {"Abcde ab", 1, "Bcdef bc"},
      {"Abcde ab", 26, "Abcde ab"},
      {"Abcde ab", 27, "Bcdef bc"},
      {"Abcde ab", 52, "Abcde ab"},
      {"Abcde ab", -1, "Zabcd za"},
      {"Abcde ab", -3, "Xyzab xy"},
      {"aBCDE AB", 0, "aBCDE AB"},
      {"aBCDE AB", 1, "bCDEF BC"},
      {"aBCDE AB", 26, "aBCDE AB"},
      {"aBCDE AB", 27, "bCDEF BC"},
      {"aBCDE AB", 52, "aBCDE AB"},
      {"aBCDE AB", -1, "zABCD ZA"}
    ]

    for {message, offset, result} <- tests do
      test "correctly encodes message '#{message}' when offset is #{offset}" do
        assert encode(unquote(message), unquote(offset)) == unquote(result)
      end
    end

    for {result, offset, message} <- tests do
      test "correctly decodes message '#{message}' when applied offset was #{offset}" do
        assert decode(unquote(message), unquote(offset)) == unquote(result)
      end
    end
  end
end
