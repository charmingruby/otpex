defmodule OtpexWeb.LogsJSON do
  alias OtpexWeb.Presenters.LogPresenter

  def log(%{log: log}) do
    LogPresenter.build_log(log)
  end
end
