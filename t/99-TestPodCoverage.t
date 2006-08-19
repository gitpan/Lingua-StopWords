#!/usr/bin/perl

use Test::More tests => 1;
plan skip_all => "Test::Pod::Coverage required for testing POD"
    unless eval "use Test::Pod::Coverage; 1";

pod_coverage_ok( "Lingua::StopWords",
    "Pod coverage is OK for Lingua::StopWords" );
