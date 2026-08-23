lambda { |stdout,stderr,status|
  output = stdout + stderr
  # bash_unit announces each test as "Running <name> ... " and completes the
  # line with SUCCESS or FAILURE. A test that errors is announced but reaches
  # neither, so a run where every announced test got a verdict is a run where
  # the tests really executed.
  # A bash error names its file and line, as in "./hiker.sh: line 6:", and
  # that marks code that could not run rather than a test that ran and failed.
  announced = output.scan(/^\s*Running \S+ \.\.\./).size
  verdicts  = output.scan(/\.\.\. (?:SUCCESS|FAILURE)/).size
  ran = announced > 0 && announced == verdicts
  broken = /: line \d+:/.match(output)
  return :green if ran && !broken && status == 0 && /^Overall result: SUCCESS/.match(output)
  return :red   if ran && !broken && /\.\.\. FAILURE/.match(output)
  return :amber
}
