# youtube-dl synchroniser

Synchronises a local archive of a number of youtube-dl compatible urls from a
config file at a scheduled time, using systemd timers for scheduling and
systemd timeouts to prevent long-running tasks still running during daytime.

## TODOs

- Config file
  - [ ] Allow commas in variables
  - [ ] Add including external url files
- [ ] Makefile for installing/uninstalling everything
- Systemd units
  - [x] Use Type=simple and RuntimeMaxSec=timelimit instead of Type=oneshot
  - [ ] Use a timer to stop the service so that it finishes at an exact time,
  not after an approximate time limit. Limiting the runtime like we are doing
  now does not guarantee that the service will have been stopped by an exact
  time, so it could run over into the morning.
