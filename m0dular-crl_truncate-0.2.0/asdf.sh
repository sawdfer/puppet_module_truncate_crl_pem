#!/bin/bash

foo=21e86
foo=$(printf '%02x' $(( "0x${foo}" +1 )))
echo $foo
