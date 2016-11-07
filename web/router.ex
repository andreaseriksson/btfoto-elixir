defmodule Btfoto.Router do
  use Btfoto.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Btfoto.Auth, repo: Btfoto.Repo
    plug Btfoto.ShoppingCart
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Btfoto do
    pipe_through :browser # Use the default browser stack

    get "/store/login", StoreController, :login
    post "/store/auth", StoreController, :auth

    resources "/appointments", AppointmentController

    get "/", PageController, :index
  end

  scope "/store", Btfoto do
    pipe_through [:browser, :require_image_nr]

    get "/", StoreController, :index
    get "/checkout", StoreController, :checkout
    get "/change_image", StoreController, :change_image
    get "/switch_image", StoreController, :switch_image
    post "/switch_image", StoreController, :switch_image
    post "/add_to_cart", StoreController, :add_to_cart
    get "/logout", StoreController, :logout
    get "/:slug", StoreController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Btfoto do
  #   pipe_through :api
  # end
end
