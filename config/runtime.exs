import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.

# ## Using releases
#
# If you use `mix release`, you need to explicitly enable the server
# by passing the PHX_SERVER=true when you start it:
#
#     PHX_SERVER=true bin/wefood start
#
# Alternatively, you can use `mix phx.gen.release` to generate a `bin/server`
# script that automatically sets the env var above.
if System.get_env("PHX_SERVER") do
  config :wefood, WefoodWeb.Endpoint, server: true
end

if config_env() == :prod do
  config :waffle,
    storage: Waffle.Storage.Google.CloudStorage,
    bucket: System.get_env("GCP_BUCKET")

  config :goth,
    json: "{\n  \"type\": \"service_account\",\n  \"project_id\": \"elated-chariot-353222\",\n  \"private_key_id\": \"ca323c7d3ae65b8c7c8c0733407b1347a061ec76\",\n  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCiswUzTIwbCCig\\nFzbEPNxVT7xWSPlgA8nCd2bp3lIJjrmm22GLLa3LBU3mNM2EPlTKuvg1GrmauaXw\\nLnl8aEWm1X8RwdU3s9CMzr1x74DsliLe6oeuLVIkX+0Sn7TdbGvM2Gngjqys9LOr\\ndps0BHKIQNS2/sOrmBV3qT4opqTTBpDTC7H0ySpusGDb4iviV0tcJnSwY1sRYrVV\\n2yrkZmUdO9s73473xmT5stY3soC3QY/w75FJYiwW0g0hHyHwRV+0sNwfvs4PM3s3\\nZhX8kmhb1rXEuLQkCcA6Px4xfr25EV4pLfShXF8Rm6ORqdueSLczgTzplhnvtD6e\\njRfMONWnAgMBAAECggEAF3SHg2W9rQf4E1xFYPUFLqdYF3hduyHQrGBaTcznNsmE\\nqjFmVpI3Q9V37YAfQLlbr/5UWhOIPm4VJhMNIIpHwE13DDBNdMJPhn0ngo1soK7k\\nSA63kLyn4uaRXuX3RRSkVdu9J8ppymVcoZNvvIgHmuz9vYPs4YgDUETt2R5tFJ7a\\ny/KOIGRgwnmgcMZibz1XMGW01j4ixym0ETTmlfW0Dp5PjAxvJm/3nNORkCucsvKN\\nbaoIvCjVa5JgmfoQP9H0tqqWufg29F2o6sG2hZEQrPOn7d1bPeXHQ0wQ3bnxQEfS\\n3j35CaioNcLv8apQO1jtGJCVdZWhsYm++OUhwuB9gQKBgQDVFstC1kFDgNHIP6+h\\nT4AZIWHRk546uVvjTr+Xnfv3UmIAWCdWXWVV5E8Pv4LxplztrHdScNe6/6k2o0z+\\nsh5gRrZnsGvj85u8iK4aRHuJExCMdsyJRtVDpf1AT6SvFHsaY/sWsW8q1ljtEvIG\\nmpU3V961uIaVJ67DByDm0PX5CQKBgQDDdoZkonkhfKc97+aWIGUA3ksbT2mfqIq+\\nOSeAxcHyjXE1AAINLBHGjdM8gV3QkXSOUbT7spB36Ff6ykRQD+vqK3NDigPFIi/8\\n4gVVesGDpW6sMIQXDN2kAFVDR6fLmicyDEZlNXZdrTGmi+Eu0ZjTRbIwUX3fMe0w\\n897JzQd1LwKBgBTvm2LiuCDQvEvHbhMUQ4q0i+7SaR5t7chEiXB1Fjdzgat0/dBv\\ndrBcsSPj9hKV/NVhN4wDCD8YNWDn5H21tGRTLkK7w63u1mNMroZoKhcKp3qVhX0L\\nV5LA8UPrT0vgYEP0hMvy/PAhhTUtwlfBwl1gpcIG8jofXv1MawAikbg5AoGBAJup\\naJ38RjtE6muJAjnM0qM+ZNH7DEL6FoQnQC5tT2e6/M0YlImo7v8RM4ib/fp73Db7\\nGwbXzfWwM2CmdIDOLTLwJ3tCDn6QG2dpGJZajIIq3ViDyq4QsPJK0ZwjFJ4wxcY1\\nwFoZmYpAw6m+/DYs9WhLuPyB6Zw2Ro8Vp/dOMQJBAoGAA7ktPbmdISkZNWgj1FaS\\neuKChwmK/8fT4qZBCoH95qU+UP9qfDiezjyXQsYyR/FeVGW/t4VbaNDoDuPwhbQy\\nZR8liGz61umvonpzGjstPt3P7aU0sljUaKFORDDUug9SADAZQT1Ou8+i6Bylxyzq\\nnIFGZPos7NmUFW/BV1yny9I=\\n-----END PRIVATE KEY-----\\n\",\n  \"client_email\": \"bucket-wefood-permission@elated-chariot-353222.iam.gserviceaccount.com\",\n  \"client_id\": \"105411815974738919889\",\n  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\n  \"token_uri\": \"https://oauth2.googleapis.com/token\",\n  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\n  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/bucket-wefood-permission%40elated-chariot-353222.iam.gserviceaccount.com\"\n}\n

  database_url =
    System.get_env("DATABASE_URL") ||
      raise """
      environment variable DATABASE_URL is missing.
      For example: ecto://USER:PASS@HOST/DATABASE
      """

  maybe_ipv6 = if System.get_env("ECTO_IPV6"), do: [:inet6], else: []

  config :wefood, Wefood.Repo,
    # ssl: true,
    url: database_url,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "2"),
    socket_options: maybe_ipv6

  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST") || "example.com"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :wefood, WefoodWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://hexdocs.pm/plug_cowboy/Plug.Cowboy.html
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    secret_key_base: secret_key_base,
    check_origin: false

  # ## Configuring the mailer
  #
  # In production you need to configure the mailer to use a different adapter.
  # Also, you may need to configure the Swoosh API client of your choice if you
  # are not using SMTP. Here is an example of the configuration:
  #
  #     config :wefood, Wefood.Mailer,
  #       adapter: Swoosh.Adapters.Mailgun,
  #       api_key: System.get_env("MAILGUN_API_KEY"),
  #       domain: System.get_env("MAILGUN_DOMAIN")
  #
  # For this example you need include a HTTP client required by Swoosh API client.
  # Swoosh supports Hackney and Finch out of the box:
  #
  #     config :swoosh, :api_client, Swoosh.ApiClient.Hackney
  #
  # See https://hexdocs.pm/swoosh/Swoosh.html#module-installation for details.
end
