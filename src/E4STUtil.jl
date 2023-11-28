module E4STUtil

using YAML
using OrderedCollections
using DataDeps
import Dates: format, @dateformat_str, now

include("inflation.jl")
include("conversions.jl")
include("metadata.jl")
include("datadeps.jl")

export usd_cr
export cpi, gdp

end # module
