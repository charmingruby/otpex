defmodule OtpexWeb.LogsJSON do
  alias OtpexWeb.Presenters.LogPresenter

  def log(%{log: log}) do
    LogPresenter.build_log(log)
  end

  def multiple_logs(%{log: log}) do
    %{
      amount_of_insertions: log.quantity,
      log_model: %{
        name: log.name,
        context: log.context,
        status: log.status,
        distribuition_id: log.distribuition_id
      }
    }
  end
end
