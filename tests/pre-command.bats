#!/usr/bin/env bats

load "$BATS_PLUGIN_PATH/load.bash"

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Creates an annotation with the file count" {
  export BUILDKITE_PLUGIN_FILE_COUNTER_PATTERN="*.bats"

  stub buildkite-agent 'annotate "Found 1 files matching *.bats" : echo Annotation created'

  run "$PWD/hooks/pre-command"

  assert_success
  assert_output --partial "Installed nix version "

  unstub buildkite-agent
}
