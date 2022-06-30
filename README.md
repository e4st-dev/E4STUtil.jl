# E4STUtil.jl

![GitHub contributors](https://img.shields.io/github/contributors/e4st-dev/E4STUtil.jl?logo=GitHub)
![GitHub last commit](https://img.shields.io/github/last-commit/e4st-dev/E4STUtil.jl/main?logo=GitHub)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![CI](https://github.com/e4st-dev/E4STUtil.jl/workflows/CI/badge.svg)](https://github.com/e4st-dev/E4STUtil.jl/actions?query=workflow%3ACI)
[![codecov](https://codecov.io/gh/e4st-dev/E4STUtil.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/e4st-dev/E4STUtil.jl)

This package is a place for handy utilities to be used in E4ST-related computations.

## Installation
```julia
using Pkg
Pkg.add("E4STUtil")
```

## Usage
```julia
using E4STUtil
```
### Functions
* `usd_cr(y1, y2) -> cr` - computes a conversion rate from USD in `y1` to USD in `y2`.
