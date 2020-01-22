defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
      ],
      test_coverage: [
        tool: ExCoveralls
      ],
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:excoveralls, "~> 0.5.7", only: :test}
    ]
  end

  defp aliases do
    [
      "app.setup.yarn": [&yarn_install/1],
      "app.setup": ["deps.get", "deps.compile", "app.setup.yarn"]
    ]
  end

  defp yarn_install(_) do
    web_apps = ["admin_web"]

    for app <- web_apps do
      Mix.shell.cmd("cd apps/#{app}/assets && yarn install")
    end
  end
end
