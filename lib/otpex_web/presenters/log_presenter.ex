defmodule OtpexWeb.Presenters.LogPresenter do
  def build_log(l) do
    %{
      id: l.id,
      name: l.name,
      context: l.context,
      status: l.status,
      distribuition_id: l.distribuition_id,
      inserted_at: l.inserted_at,
      updated_at: l.updated_at
    }
  end
end
