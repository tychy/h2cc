#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./h2cc "$input" > tmp.s
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42
assert 21 "10+20-9"
assert 41 " 12 + 34 - 5 "
assert 11 "+11"
assert 12 "-1+13"
assert 0 "1>2"
assert 1 "2>1"
assert 1 "1>=1"
assert 0 "1>=2"
assert 1 "2>=1"
assert 1 "1<2"
assert 0 "2<1"
assert 1 "1<=1"
assert 0 "1<=0"
assert 1 "1<=2"
assert 0 "1==2"
assert 1 "1==1"
assert 0 "1!=1"
assert 1 "1!=2"
assert 1 "1+2>2"
assert 0 "1+2<2"
assert 1 "1+2>=2"
assert 0 "1+2<=1"
assert 0 "1+2==2"
assert 1 "1+2!=2"
echo OK
