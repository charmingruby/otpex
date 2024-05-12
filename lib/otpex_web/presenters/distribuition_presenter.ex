defmodule OtpexWeb.Presenters.DistribuitionPresenter do
  def build_distribuition(d) do
    %{
      id: d.id,
      name: d.name,
      loc: d.loc,
      inserted_at: d.inserted_at,
      updated_at: d.updated_at
    }
  end
end
