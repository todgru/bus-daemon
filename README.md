# bus-daemon

Record Trimet vehicle locaton data to PostgreSQL db. Daemonized process.

# Setup

Requires environment variables:

```
export TRIMET_APP_ID=your-app-id
export TODGRU_ENV=test|todgru
export DATABASE_PASSWORD=foobar
```

See `lib/bus-daemon.rb` for db settings.

# Run

Launch with

`$ ruby bus-daemon-control.rb start`

Stop:

`$ ruby bus-daemon-control.rb stop`

Restart:

`$ ruby bus-daemon-control.rb stop`

# Warning

One million rows takes up around 280MB. Data is sampled every 10 seconds.
