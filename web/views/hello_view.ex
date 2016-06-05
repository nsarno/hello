defmodule Hello.HelloView do
  use Hello.Web, :view

  def render("index.json", _assigns) do
    %{hello: "poney"}
  end
end
