defmodule EggTimer.Clock do
  @config Application.compile_env(:egg_timer, __MODULE__, [])

  if @config[:freezable] do
    def utc_now() do
      Process.get(:utc_now) || NaiveDateTime.utc_now()
    end

    def freeze(%NaiveDateTime{} = utc_now \\ NaiveDateTime.utc_now()) do
      Process.put(:utc_now, utc_now)
      utc_now
    end

    def unfreeze() do
      Process.delete(:utc_now)
    end
  else
    def utc_now() do
      NaiveDateTime.utc_now()
    end
  end
end
