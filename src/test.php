<?php

$yaml = file_get_contents(__DIR__ . '/config_test.types.yml');
$data = yaml_parse($yaml);
echo sprintf('%0.01f', $data['exp']) . "\n";
echo sprintf('%0.16f', $data['float']) . "\n";
