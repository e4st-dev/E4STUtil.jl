module E4STUtil

using YAML
using OrderedCollections
using DataDeps
import Dates: format, @dateformat_str, now

include("inflation.jl")
include("conversions.jl")
include("metadata.jl")
include("datadeps.jl")

"""
    calc_crf(wacc, econ_life) -> crf

Calculates the capital recovery factor given `wacc` (weighted average cost of capital) and `econ_life`, the economic lifetime of the investment.
"""
function calc_crf(wacc, econ_life)
    x = (1+wacc) ^ econ_life
    (wacc * x) / (x - 1)
end
export calc_crf

export usd_cr
export cpi, gdp

end # module
