{
  writeShellScriptBin,
  a,
  b,
}:
writeShellScriptBin "customexample" ''
  echo "Example output: ${a}${b}"
''
