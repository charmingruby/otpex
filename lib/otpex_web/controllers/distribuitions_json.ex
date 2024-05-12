defmodule OtpexWeb.DistribuitionsJSON do
  alias OtpexWeb.Presenters.DistribuitionPresenter

  def distribuition(%{distribuition: distribuition}) do
    DistribuitionPresenter.build_distribuition(distribuition)
  end
end
