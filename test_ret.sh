#!/bin/bash

test_consume()
{
b=`sh test_re.sh`
return $b
}

test_consume
echo $?
