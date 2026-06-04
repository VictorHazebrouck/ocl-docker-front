if [ "$CHROME_BIN" = "" ]; then
    echo "'CHROME_BIN' env var not set."
    exit 1;
    # fix: export CHROME_BIN=$(which chromium)
fi

if ! npm ci; then
    echo "'npm ci' failed"
    exit 1
fi

if ! npm test; then
    echo "'npm test' failed."
    exit 1
fi

rm -rf test-results
mkdir -p test-results

REPORT_DIR="reports"

if [ ! -d "$REPORT_DIR" ]; then
    echo "Error: JUnit report directory not found."
    exit 1
fi

cp -R "$REPORT_DIR"/* test-results/
