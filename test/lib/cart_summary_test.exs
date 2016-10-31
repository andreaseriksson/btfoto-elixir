defmodule Btfoto.CartSummaryTest do
  use ExUnit.Case
  alias Btfoto.{Repo, CartSummary, Cart, CartItem, Product}

  @cart_items [
    %CartItem{
      quantity: 1,
      product: %Product{
        price: 79.2,
        discount: 10.0,
        vat: 0.25,
        allow_discount: true,
        freight: true
      }
    },
    %CartItem{
      quantity: 1,
      product: %Product{
        price: 159.2,
        discount: 0.0,
        vat: 0.25,
        allow_discount: true,
        freight: true
      }
    },
    %CartItem{
      quantity: 2,
      product: %Product{
        price: 239.2,
        discount: 10.0,
        vat: 0.25,
        allow_discount: true,
        freight: true
      }
    }
  ]

  test "sets up test" do
    assert true
  end

  test "it sums up the amount of items in cart" do
    cart_summary = CartSummary.output(@cart_items)
    assert cart_summary.total_items == 4
  end

  test "it sums up the price of items in cart" do
    cart_summary = CartSummary.output(@cart_items)
    assert cart_summary.total_price == 477.6
  end
end
