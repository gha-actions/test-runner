<div align="center">
	<h1>Test Runner</h1> 
	<br>
	<p>A versatile GitHub Action for automating test execution across different languages and frameworks.</p>
	<a href="https://github.com/gha-actions/test-runner/actions"><img src="https://github.com/gha-actions/test-runner/workflows/Bump%20version/badge.svg?branch=main" alt="Build status"></a>
<!-- 	<a href="./coverage/lcov-report/index.html"><img src="https://img.shields.io/coveralls/github/jaynath-d/cc-suite" alt="Coverage status"></a> -->
	<a href="https://img.shields.io/github/v/tag/gha-actions/test-runner"><img src="https://img.shields.io/github/v/tag/gha-actions/test-runner" alt="Stable version"></a>
	<a href="https://img.shields.io/github/v/release/gha-actions/test-runner?color=%233D9970"><img src="https://img.shields.io/github/v/release/gha-actions/test-runner?color=%233D9970" alt="Stable version"></a>
</div>

___

## Usage

_Note: We don't recommend using the @master version unless you're happy to test the latest changes._

```yaml
# example 1: on push to master
name: Node Test Runner
on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu:latest
    permissions:
      contents: write
    steps:
    - uses: actions/checkout@v3
      with:
        fetch-depth: '0'

    - name: Run tests 🧪
      uses: gha-actions/test-runner@0.0.2 # Don't use @master or @v1 unless you're happy to test the latest version
      env:
        LANGUAGE:'node'
```

```yaml
# example 2: on merge to master from pull request (recommended)
name: Node Test Runner
on:
  pull_request:
    types:
      - closed
    branches:
      - master

jobs:
  build:
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-22.04
    permissions:
      contents: write
    steps:
    - uses: actions/checkout@v3
      with:
        ref: ${{ github.event.pull_request.merge_commit_sha }}
        fetch-depth: '0'

    - name: Run tests 🧪
      uses: gha-actions/test-runner@0.0.2 # Don't use @master or @v1 unless you're happy to test the latest version
      env:
        LANGUAGE:'node'

```

### Options

**Environment Variables**

- **LANGUAGE** **_(required)_** - Required for test run: The language should be one of the following options: `Python`, `Node.js`, or `JavaScript`.

#### Supported Language
[![Python](https://img.shields.io/badge/language-Python-blue.svg)](https://www.python.org/)
[![Node.js](https://img.shields.io/badge/language-Node.js-green.svg)](https://nodejs.org/)
[![JavaScript](https://img.shields.io/badge/language-JavaScript-yellow.svg)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

