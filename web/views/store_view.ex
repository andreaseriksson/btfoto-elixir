defmodule Btfoto.StoreView do
  use Btfoto.Web, :view

  @vat 0.25
  @base_url "https://btfoto.s3.amazonaws.com/uploads/"

  def price_formatter(product) do
    price = decimal_to_float(product.price) * (1 + @vat)
    discount_price = decimal_to_float(product.discount) * (1 + @vat)

    if discount_price > 0 do
      ~s(<small class="text-muted" style="text-decoration: line-through">#{Number.Currency.number_to_currency(price)}</small>
         <span class="text-danger">#{Number.Currency.number_to_currency(discount_price)}</span>)
    else
      Number.Currency.number_to_currency(price)
    end
  end

  def picture_url(picture) do
    folder = "#{picture.year}#{picture.school}" |> String.downcase
    "#{@base_url}picture/#{folder}/#{picture.image}"
  end

  defp decimal_to_float(decimal) do
    to_string(decimal) |> String.to_float
  end
end
