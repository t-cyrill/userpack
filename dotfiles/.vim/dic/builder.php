<?php
$keywords = array(
    '__halt_compiler', 'abstract', 'and', 'array', 'as',
    'break', 'callable', 'case', 'catch', 'class', 'clone', 'const', 'continue',
    'declare', 'default', 'die', 'do', 'echo', 'else', 'elseif',
    'empty', 'enddeclare', 'endfor', 'endforeach', 'endif', 'endswitch', 'endwhile',
    'eval', 'exit', 'extends', 'final', 'for', 'foreach', 'function', 'global', 'goto',
    'if', 'implements', 'include', 'include_once', 'instanceof', 'insteadof',
    'interface', 'isset', 'list', 'namespace', 'new', 'or', 'print', 'private',
    'protected', 'public', 'require', 'require_once', 'return', 'static', 'switch',
    'throw', 'trait', 'try', 'unset', 'use', 'var', 'while', 'xor'
);

$predefined_constants = array(
    '__CLASS__', '__DIR__', '__FILE__', '__FUNCTION__',
    '__LINE__', '__METHOD__', '__NAMESPACE__', '__TRAIT__'
);

$functions  = function_exists('get_defined_functions')   ? get_defined_functions()   : array();
$constants  = function_exists('get_defined_constants')   ? get_defined_constants()   : array();
$interfaces = function_exists('get_declared_interfaces') ? get_declared_interfaces() : array();
$classes    = function_exists('get_declared_classes')    ? get_declared_classes()    : array();

$class_constants = array();
foreach ($classes as $class) {
    $inst = new ReflectionClass($class);
    $class_constants = array_merge($class_constants, array_keys($inst->getConstants()));
}

$arrays = array_merge(
    $keywords,
    $functions['internal'],
    array_keys($constants),
    $interfaces,
    $classes,
    $class_constants
);
sort($arrays);
$arrays = array_unique($arrays);
echo implode("\n", $arrays);

