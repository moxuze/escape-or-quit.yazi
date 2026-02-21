# escape-or-quit.yazi

If you are in find mode, visual mode, select mode, filter mode, or search mode, execute `escape`, otherwise execute `quit`.


The boolean options: `--escape-all`, `--escape-find`, `--escape-visual`, `--escape-select`, `--escape-filter`, `--escape-search` will be passed to `escape` command (without `escape-` prefixes), [Referece](https://yazi-rs.github.io/docs/next/configuration/keymap/#mgr.escape).

The integer option `--quit-code` and the string option `--quit-no-cwd-file` will be passed to `quit` command (without `quit-` prefixes), [Reference](https://yazi-rs.github.io/docs/next/configuration/keymap/#mgr.quit).

Just install it via:

```sh
ya pkg add moxuze/escape-or-quit
```

Then add this to your `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = '<Esc>'
run = 'plugin escape-or-quit'
desc = 'Escape or quit'
```

ENJOY IT.
