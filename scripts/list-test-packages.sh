#!/usr/bin/env bash
# List packages for testing, excluding those not used by cmd/prometheus.
# Caller passes build tags to go test / go list as needed; this script only filters packages.
set -e

# Exclude: not in cmd/prometheus build, or original scrape/storage/remote (we use pp-pkg).
EXCLUDE_REGEX='prometheus/rules$|prometheus/cmd/promtool$|prometheus/documentation/examples/custom-sd|prometheus/pp/go/server$|prometheus/prompb/rwcommon$|prometheus/promql/promqltest$|prometheus/util/fmtutil$|prometheus/util/junitxml$|prometheus/scrape$|prometheus/storage/remote'

go list ./... 2>/dev/null | grep -v -E "$EXCLUDE_REGEX"
