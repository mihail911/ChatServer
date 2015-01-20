#!/usr/bin/env sh
find . -name '*.java' -print0 | xargs -0 javac
