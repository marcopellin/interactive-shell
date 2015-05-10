# Interactive-shell  [![Build Status](https://travis-ci.org/drKraken/interactive-shell.svg?branch=master)](https://travis-ci.org/drKraken/interactive-shell)

[![Join the chat at https://gitter.im/drKraken/interactive-shell](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/drKraken/interactive-shell?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

<img src='http://i61.tinypic.com/n2iwpc.png' width='500' height='290'/>

Want to learn basic UNIX cmds quickly? Do you prefer learning by doing? Then this is for you.

Follow easy exercises and learn how to use a UNIX terminal by typing valid commands.

Run it easily (if you believe me):

```bash
bash <(curl -s https://raw.githubusercontent.com/drKraken/interactive-shell/master/interactive.sh)
```

or you can download it, view and then run.

```bash
wget https://raw.githubusercontent.com/drKraken/interactive-shell/master/interactive.sh;
cat ./interactive.sh
bash ./interactive.sh
```

Also, you can make it available as a console command

```bash
curl -L https://raw.githubusercontent.com/drKraken/interactive-shell/master/interactive.sh -o /usr/local/bin/interactive-sh && chmod +x /usr/local/bin/interactive-sh
```
and then run it with ``interactive-sh`` command.

If you accidentally leave the script, don't be afraid, the script will save all your scores and you can restart from the same stage.

### TODO
> 
- Improve code
- Add testing with Bats
- Create clean documentation for commands
- Add more exercises
- Add script alternative for ```cmd```

License: MIT

Built by [drKraken](https://github.com/drkraken)
