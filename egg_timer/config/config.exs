import Config

if config_env() == :test do
  config :egg_timer, EggTimer.Clock, freezable: true
end
