use strict;
use warnings;
use Test::More;
use WWW::Form::UrlEncoded::XS qw/build_urlencoded/;
use JSON;

my @data = (
    ['a'=>'b'] => 'a=b',
    [['a'=>'b']] => 'a=b',
    [{'a'=>'b'}] => 'a=b',
    ['a'=>['b','c']] => 'a=b&a=c',
    [['a'=>['b','c']]] => 'a=b&a=c',
    [{'a'=>['b','c']}] => 'a=b&a=c',
    ['a'=>'b','c'=>'d'] => 'a=b&c=d',
    [' a '=>' b '] => '+a+=+b+',
    ['a'=>'b','c'=>'d','e'] => 'a=b&c=d&e=',
    ['a'] => 'a=',
    ['a'=>undef] => 'a=',
    [undef] => '=',
    [] => '',
);

while ( @data ) {
    my $data = shift @data;
    my $test = shift @data;
    is( build_urlencoded(@$data), $test, JSON::encode_json($data));
}

done_testing;

