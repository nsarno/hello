defmodule Hello.HelloControllerTest do
  use Hello.ConnCase

  test "GET /api/hello" do
    conn = get conn(), "/api/hello"
    assert json_response(conn, 200) == %{"hello" => "poney"}
  end
end
