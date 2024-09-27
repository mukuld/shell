#!/bin/bash

test_return()
{
   a="My name is Mukul"
   return $a
}

test_return
echo $?
