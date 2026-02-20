# escape-or-quit.yazi

If you are in find mode, visual mode, select mode, or search mode, execute `escape`, otherwise execute `quit`.

The find mode cannot be determined correctly, and the filter mode cannot be determined.

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
