const _year2gdp = Dict(
    1929=>9.418,
    1930=>9.073,
    1931=>8.141,
    1932=>7.188,
    1933=>6.989,
    1934=>7.371,
    1935=>7.523,
    1936=>7.615,
    1937=>7.941,
    1938=>7.714,
    1939=>7.639,
    1940=>7.731,
    1941=>8.253,
    1942=>8.909,
    1943=>9.316,
    1944=>9.538,
    1945=>9.785,
    1946=>11.047,
    1947=>12.259,
    1948=>12.947,
    1949=>12.926,
    1950=>13.087,
    1951=>14.014,
    1952=>14.256,
    1953=>14.429,
    1954=>14.563,
    1955=>14.809,
    1956=>15.313,
    1957=>15.821,
    1958=>16.181,
    1959=>16.403,
    1960=>16.627,
    1961=>16.804,
    1962=>17.009,
    1963=>17.204,
    1964=>17.466,
    1965=>17.786,
    1966=>18.284,
    1967=>18.815,
    1968=>19.616,
    1969=>20.578,
    1970=>21.663,
    1971=>22.762,
    1972=>23.746,
    1973=>25.047,
    1974=>27.301,
    1975=>29.829,
    1976=>31.471,
    1977=>33.426,
    1978=>35.778,
    1979=>38.746,
    1980=>42.246,
    1981=>46.243,
    1982=>49.1,
    1983=>51.023,
    1984=>52.864,
    1985=>54.536,
    1986=>55.634,
    1987=>57.01,
    1988=>59.021,
    1989=>61.335,
    1990=>63.631,
    1991=>65.783,
    1992=>67.282,
    1993=>68.877,
    1994=>70.347,
    1995=>71.823,
    1996=>73.138,
    1997=>74.399,
    1998=>75.236,
    1999=>76.296,
    2000=>78.025,
    2001=>79.783,
    2002=>81.026,
    2003=>82.625,
    2004=>84.843,
    2005=>87.504,
    2006=>90.204,
    2007=>92.642,
    2008=>94.419,
    2009=>95.024,
    2010=>96.166,
    2011=>98.164,
    2012=>100,
    2013=>101.751,
    2014=>103.654,
    2015=>104.691,
    2016=>105.74,
    2017=>107.747,
    2018=>110.321,
    2019=>112.294,
    2020=>113.648,
    2021=>118.37, 
    2022=>117.965,
    2023=>122.265
)
struct GDP end
const gdp = GDP()
maxyear(::GDP) = 2023

_year2cpi = Dict(
    1913=>9.9,
    1914=>10.0,
    1915=>10.1,
    1916=>10.9,
    1917=>12.8,
    1918=>15.1,
    1919=>17.3,
    1920=>20.0,
    1921=>17.9,
    1922=>16.8,
    1923=>17.1,
    1924=>17.1,
    1925=>17.5,
    1926=>17.7,
    1927=>17.4,
    1928=>17.1,
    1929=>17.1,
    1930=>16.7,
    1931=>15.2,
    1932=>13.7,
    1933=>13.0,
    1934=>13.4,
    1935=>13.7,
    1936=>13.9,
    1937=>14.4,
    1938=>14.1,
    1939=>13.9,
    1940=>14.0,
    1941=>14.7,
    1942=>16.3,
    1943=>17.3,
    1944=>17.6,
    1945=>18.0,
    1946=>19.5,
    1947=>22.3,
    1948=>24.1,
    1949=>23.8,
    1950=>24.1,
    1951=>26.0,
    1952=>26.5,
    1953=>26.7,
    1954=>26.9,
    1955=>26.8,
    1956=>27.2,
    1957=>28.1,
    1958=>28.9,
    1959=>29.1,
    1960=>29.6,
    1961=>29.9,
    1962=>30.2,
    1963=>30.6,
    1964=>31.0,
    1965=>31.5,
    1966=>32.4,
    1967=>33.4,
    1968=>34.8,
    1969=>36.7,
    1970=>38.8,
    1971=>40.5,
    1972=>41.8,
    1973=>44.4,
    1974=>49.3,
    1975=>53.8,
    1976=>56.9,
    1977=>60.6,
    1978=>65.2,
    1979=>72.6,
    1980=>82.4,
    1981=>90.9,
    1982=>96.5,
    1983=>99.6,
    1984=>103.9,
    1985=>107.6,
    1986=>109.6,
    1987=>113.6,
    1988=>118.3,
    1989=>124.0,
    1990=>130.7,
    1991=>136.2,
    1992=>140.3,
    1993=>144.5,
    1994=>148.2,
    1995=>152.4,
    1996=>156.9,
    1997=>160.5,
    1998=>163.0,
    1999=>166.6,
    2000=>172.2,
    2001=>177.1,
    2002=>179.9,
    2003=>184.0,
    2004=>188.9,
    2005=>195.3,
    2006=>201.6,
    2007=>207.342,
    2008=>215.303,
    2009=>214.537,
    2010=>218.056,
    2011=>224.939,
    2012=>229.594,
    2013=>232.957,
    2014=>236.736,
    2015=>237.017,
    2016=>240.007,
    2017=>245.120,
    2018=>251.107,
    2019=>255.657,
    2020=>258.811,
    2021=>270.970,
    2022=>292.655,
    2023=>304.702

)
struct CPI end
const cpi = CPI()
maxyear(::CPI) = 2023

"""
    usd_cr(y1, y2; source=gdp, future=nothing) -> r

Computes a conversion rate from USD in `y1` to USD in `y2`.

Optional keyword arguments:
* `source` - choose between `gdp` and `cpi`, defaults to `gdp`
* `future` - assumed future inflation rate.  can be either:
    * `nothing` (default) - throw an error when a year outside of the range is given
    * `rate` - the assumed rate of inflation for years beyond the max year i.e. `0.02` for 2% inflation rate 

Input Data Sources:
* `gdp` - Updated with 2021 data from [bea.gov](https://apps.bea.gov/iTable/iTable.cfm?reqid=19&step=3&isuri=1&1921=survey), Table 1.1.9.
* `cpi` - Updated with 2021 data from [bls.gov](https://data.bls.gov/timeseries/CUUR0000SA0)
"""
function usd_cr(y1::Int64, y2::Int64; source=gdp, future=nothing)
    _usd_cr(y1, y2, source, future)
end

function _usd_cr(y1, y2, source, future)
    gdp1 = _get_metric(y1, source, future)
    gdp2 = _get_metric(y2, source, future)
    return gdp2/gdp1
end

function _get_metric(y, source::GDP, future::Nothing)
    get(_year2gdp, y) do
        error("Year $y not recorded for source $source")
    end
end

function _get_metric(y, source::CPI, future::Nothing)
    get(_year2cpi, y) do
        error("Year $y not recorded for source $source")
    end
end

function _get_metric(y, source, future::Number)
    my = maxyear(source)
    if y <= my
        return _get_metric(y, source, nothing)
    else
        mgdp = _get_metric(my, source, nothing)
        ydiff = y-my
        return mgdp*(1+future)^ydiff
    end
end



