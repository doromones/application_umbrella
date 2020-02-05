use Mix.Config

database_url = "ecto://postgres:postgres@localhost/application_umbrella"

config :core,
       Core.Repo,
       # ssl: true,
       url: database_url,
       pool_size: 10

secret_key_base = "tbQb7Vvh4DBCrdlxWSOJCPHx53G1dNEFUrgXI0ALgXlWC89lelE/CL9U/zgN5wSL"

config :admin_web,
       AdminWeb.Endpoint,
       http: [
         port: String.to_integer(System.get_env("PORT") || "4000")
       ],
       secret_key_base: secret_key_base,
       server: true

config :api_web,
       ApiWeb.Endpoint,
       http: [
         port: String.to_integer(System.get_env("PORT") || "4000")
       ],
       secret_key_base: secret_key_base,
       server: true

config :api_web, ApiWeb.Endpoint,
       http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
       secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :admin_web, AdminWeb.Endpoint, server: true
#     config :api_web, ApiWeb.Endpoint, server: true
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.
