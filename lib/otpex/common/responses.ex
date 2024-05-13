defmodule Otpex.Common.Responses do
  def not_found_response(entity) do
    {:error, {:not_found, entity}}
  end
end
