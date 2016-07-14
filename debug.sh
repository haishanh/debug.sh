#!/bin/bash
# haishanh

# debug level
# a high debug level will give a verbose output
DEBUG=${DEBUG:-2}
colors=('\e[0m' '\e[0;31m' '\e[0;32m' '\e[0;33m')
default=0
red=1
green=2
yellow=3

err_=1
warn_=2
info_=3

info()
{
  if [ $DEBUG -ge $info_ ]; then
    printf "INFO : ${*}\n"
  fi
}

warn()
{
  if [ $DEBUG -ge $warn_ ]; then
    printf "${colors[$yellow]}WARN :${colors[$default]} ${*}\n"
  fi
}

err()
{
  if [ $DEBUG -ge $err_ ]; then
    printf "${colors[$red]}ERROR:${colors[$default]} ${*}\n"
  fi
}

run()
{
  # [ ! -z ${DEBUG} ] && printf "running command: ${*}\n"
  info "running command: ${*}"
  "${@}"
}


## testing

if [ `basename ${0}` == "debug.sh" ]; then
  # define the test
  selftest()
  {
    printf "\n\t--- Begin test ---\n\n"
    info Hello world!
    warn This is a warning
    err This is a error
    run ls -l --color=tty
    printf "\n\t--- Finish test ---\n"
  }

  # run the test
  selftest
fi
