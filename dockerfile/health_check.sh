#!/bin/sh

function _main
{

  indexCount=`ps -ef | grep frp | grep -v grep | wc -l`
  [ $indexCount -eq 0 ] && exit 1

  exit 0
}

# main

_main "$@"