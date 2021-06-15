# Jackett addon for Hass.io

The torrent client for Hass.io with OpenVPN support.

## Installation

The installation of this add-on is pretty straightforward and not different in
comparison to installing any other Hass.io add-on.

1. Add https://github.com/haberda/hassio_addons to your Hass.io instance as a repository.
1. Install the "Jackett" add-on.
1. Start the "Jackett" add-on.
1. Check the logs of the "Tranmission" to see if everything went well.
1. Open the web-ui

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Jackett add-on configuration:

```json
{
  "log_level": "info",
  "openvpn_enabled": false,
  "openvpn_config": "",
  "openvpn_username": "",
  "openvpn_password": ""
}
```

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can
be changed to be more or less verbose, which might be useful when you are
dealing with an unknown issue. Possible values are:

- `trace`: Show every detail, like all called internal functions.
- `debug`: Shows detailed debug information.
- `info`: Normal (usually) interesting events.
- `warning`: Exceptional occurrences that are not errors.
- `error`:  Runtime errors that do not require immediate action.
- `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a
more severe level, e.g., `debug` also shows `info` messages. By default,
the `log_level` is set to `info`, which is the recommended setting unless
you are troubleshooting.

### Option: `openvpn_enabled`

Enable OpenVPN to anonymize your torrent activity.

### Option: `openvpn_config`

The name of .ovpn file WITHOUT the .ovpn extenstion (e.g. myFile.ovpn will be entered as myFile). Must be put it in `/config/openvpn`.

### Option: `openvpn_username`

Your OpenVPN username.

### Option: `openvpn_password`

Your OpenVPN password.

## Changelog & Releases

The format of the log is based on the upstream Jackett software.
