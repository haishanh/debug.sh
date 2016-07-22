# debug.sh

A simple bash *library* for your bash script.

## How to use

Just source `debug.sh` in your script, then using functions provided.

Try run `test.sh`:

```sh
# to get a verbose output
$ DEBUG=100 ./test.sh

# only print error and warning messages
$ DEBUG=2 ./test.sh

# disable message printed by `debug.sh`
$ DEBUG=0 ./test.sh
```

## Functions

Here are functions can be used.

To print something using:

  * `info`
  * `warn`
  * `err`

Example:

```sh
info "Hello world!"
warn "Using at your own risk"
err "Command not found."
```

To run a command using:

  * `run`

Example:

```sh
run ls -l
```
