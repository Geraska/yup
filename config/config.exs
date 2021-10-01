import Config

config :yup, Yup.Repo,
  database: "arslan_test",
  username: "arslan",
  password: "1234567890",
  hostname: "192.168.0.2"

config :yup, ecto_repos: [Yup.Repo]
