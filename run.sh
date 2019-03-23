#!/bin/sh

ENGINES="pogreb goleveldb bbolt badger bitcask"
GOROUTINES="1 10"

go build

for goroutines in ${GOROUTINES}; do
  for engine in ${ENGINES}; do
    echo "Benchmarking ${engine} with ${goroutines} threads ..."
    ./bitcask-bench -d ./tmp -c "${goroutines}" -e "${engine}"
  done
done
