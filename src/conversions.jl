const SHORT_TONS_TO_METRIC_TONS = 0.9071847 # Source https://www.eia.gov/tools/faqs/faq.php?id=7&t=2

"""
    short2metric(x)

Convert `x` from short tons to metric tons.

See also: metric2short
"""
short2metric(m) = m*SHORT_TONS_TO_METRIC_TONS

"""
    metric2short(x)

Convert `x` from metric tons to short tons.

See also: short2metric
"""
metric2short(m) = m/SHORT_TONS_TO_METRIC_TONS

export short2metric, metric2short
    