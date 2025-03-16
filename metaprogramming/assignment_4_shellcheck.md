# Add a [GitHub Action](https://github.com/features/actions) to the repository to run shellcheck on any shell files in this repository (here is [one way to do it](https://github.com/marketplace/actions/shellcheck))

```yml
name: ShellCheck CI

on:
  push:
    branches: ["main"]
  pull_request:

permissions:
  contents: read

jobs:
  shellcheck:
    name: Run ShellCheck
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run ShellCheck
        uses: ludeeus/action-shellcheck@master
        env:
          SHELLCHECK_OPTS: -e SC2059 -e SC2034 -e SC1090 -e SC2002 -e SC2181 -e SC2188 -e SC2164 -e SC2038 -e SC2016 -e SC2005 -e SC2035 -e SC2086 -e SC2012 -e SC2164 -e SC2063 -e SC2045 -e SC2062
```
