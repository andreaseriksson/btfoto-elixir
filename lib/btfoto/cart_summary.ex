defmodule Btfoto.CartSummary do
  @vat 0.25
  @shipping_fee 33
  @pre_pay_fee 19
  @freight_free 650
  @discount_days 20

  def output(cart_items \\ []) do
    %{
      total_items: total_items(cart_items),
      total_price:  total_price(cart_items),
      total_price_with_vat: total_price_with_vat(cart_items),
      vat: vat(cart_items),
      discount: 0,
      freight_free: total_price_with_vat(cart_items) > @freight_free,
      amount_before_freight_free: amount_before_freight_free(cart_items),
      total_price_with_freight: 0,
      shipping_fee: @shipping_fee
    }
  end

  defp total_items(cart_items) do
    cart_items
    |> Enum.reduce(0, fn(cart_item, sum) ->
      sum + cart_item.quantity
    end)
  end

  defp total_price(cart_items) do
    cart_items
    |> Enum.reduce(0.0, fn(cart_item, sum) ->
      sum + (decimal_to_float(cart_item.product.price) * cart_item.quantity)
    end)
    |> Float.round(2)
  end

  defp total_price_with_vat(cart_items) do
    (total_price(cart_items) * (1 + @vat))
    |> Float.round(2)
  end

  defp vat(cart_items) do
    (total_price(cart_items) * @vat)
    |> Float.round(2)
  end

  defp total_price_with_freight(cart_items) do
    0
  end

  defp amount_before_freight_free(cart_items) do
    if total_price_with_vat(cart_items) >= @freight_free do
      0.0
    else
      (@freight_free - total_price_with_vat(cart_items))
      |> Float.round(2)
    end
  end

  defp decimal_to_float(decimal) do
    to_string(decimal) |> String.to_float
  end
end
