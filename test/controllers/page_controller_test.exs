defmodule Btfoto.PageControllerTest do
  use Btfoto.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "BTFoto"
  end
end
