# youtube-dl synchroniser

Synchronises a local archive of a number of youtube-dl compatible urls from a
config file at a scheduled time, using systemd timers for scheduling and
systemd timeouts to prevent long-running tasks still running during daytime.

## TODOs

- Config file
  - [ ] Allow commas in variables
  - [ ] Add including external url files
- [ ] Makefile for installing/uninstalling everything
