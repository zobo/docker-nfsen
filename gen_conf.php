#!/bin/php
<?php

$sources = "%sources = (\n";

foreach (explode(":", $_SERVER['NFSEN_SOURCES']) as $def) {
	list($ident, $port, $col) = explode(",", $def);
	$sources .= "\t'{$ident}'\t=> { 'port' => '{$port}', 'col' => '{$col}' },\n";
}
$sources .=");\n";

/*
%sources = (
    'upstream1'    => { 'port' => '9995', 'col' => '#0000ff', 'type' => 'netflow' },
    'peer1'        => { 'port' => '9996', 'IP' => '172.16.17.18' },
    'peer2'        => { 'port' => '9996', 'IP' => '172.16.17.19' },
);
*/

$conf = file_get_contents("/nfsen.conf");

$conf = preg_replace('/%sources = .*;\n/sU', $sources, $conf);

echo $conf;

