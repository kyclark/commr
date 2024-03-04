#!/usr/bin/env bash

set -u

PRG="cargo run --"
F1="tests/inputs/file1.txt"
F2="tests/inputs/file2.txt"
EMPTY="tests/inputs/empty.txt"
BLANK="tests/inputs/blank.txt"
OUTDIR="tests/expected"

$PRG         $EMPTY $EMPTY > $OUTDIR/empty_empty.out
$PRG         $F1    $EMPTY > $OUTDIR/file1_empty.out
$PRG         $EMPTY $F2    > $OUTDIR/empty_file2.out
$PRG         $F1    $F1    > $OUTDIR/file1_file1.out
$PRG         $F1    $F2    > $OUTDIR/file1_file2.out

$PRG         $BLANK $F1    > $OUTDIR/blank_file1.out
$PRG         $F1    $BLANK > $OUTDIR/file1_blank.out
$PRG -1      $F1    $BLANK > $OUTDIR/file1_blank.1.out
$PRG -2      $F1    $BLANK > $OUTDIR/file1_blank.2.out
$PRG -3      $F1    $BLANK > $OUTDIR/file1_blank.3.out

$PRG         $F1    $F2    > $OUTDIR/file1_file2.out
$PRG -1      $F1    $F2    > $OUTDIR/file1_file2.1.out
$PRG -2      $F1    $F2    > $OUTDIR/file1_file2.2.out
$PRG -3      $F1    $F2    > $OUTDIR/file1_file2.3.out

$PRG -12     $F1    $F2    > $OUTDIR/file1_file2.12.out
$PRG -23     $F1    $F2    > $OUTDIR/file1_file2.23.out
$PRG -13     $F1    $F2    > $OUTDIR/file1_file2.13.out
$PRG -123    $F1    $F2    > $OUTDIR/file1_file2.123.out

$PRG -i -1   $F1    $F2    > $OUTDIR/file1_file2.1.i.out
$PRG -i -2   $F1    $F2    > $OUTDIR/file1_file2.2.i.out
$PRG -i -3   $F1    $F2    > $OUTDIR/file1_file2.3.i.out

$PRG -i -12  $F1    $F2    > $OUTDIR/file1_file2.12.i.out
$PRG -i -23  $F1    $F2    > $OUTDIR/file1_file2.23.i.out
$PRG -i -13  $F1    $F2    > $OUTDIR/file1_file2.13.i.out
$PRG -i -123 $F1    $F2    > $OUTDIR/file1_file2.123.i.out

$PRG -d :    $F1    $F2    > $OUTDIR/file1_file2.delim.out
