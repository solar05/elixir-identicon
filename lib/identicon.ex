defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
      |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [red, green, blue | _tail]} = image) do
    %Identicon.Image{image | color: {red, green, blue}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)

  end

  def mirror_row([first, second | _tail] = row) do
    row ++ [second, first]
  end

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def hello do
    :world
  end
end
