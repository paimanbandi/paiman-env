# paiman-env


| Name | Link |
| ------ | ------ |
| Terminal | https://iterm2.com |
| Font | https://github.com/tonsky/FiraCode |
| Theme | https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Gruvbox%20Dark.itermcolors |

iTerm2 > Preferences... > Profiles > Text > Font > Fira Code

iTerm2 > Preferences... > Profiles > Colors > Color Presets... > Gruvbox Dark

```sh
docker build -t paiman-env .
docker run -it --rm -v "$(pwd):/paiman-env" -v var/run/docker.sock:var/run/docker.sock paiman-env
```

