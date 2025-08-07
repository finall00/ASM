#!/bin/bash


if [[ $2 == "d" ]] ; then
  nasm -g -f elf64 -g src/$1.asm -o target/$1.o 
  ld target/$1.o -o target/$1
  rm target/$1.o
else
  nasm -f elf64 -g src/$1.asm -o target/$1.o
  ld target/$1.o -o target/$1
  rm target/$1.o
fi

