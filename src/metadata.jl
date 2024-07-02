"""
    save_metadata(file::String, description::String) -> metadata

Saves metadata for `file` to `joinpath(dirname(file), "metadata.yml")`, making it if needed.
"""
function save_metadata(file::String, description::String)
    meta_file = joinpath(dirname(file), "metadata.yml")

    if isfile(meta_file)
        meta = YAML.load_file(meta_file, dicttype=OrderedDict{String, Any})
    else
        meta = OrderedDict{String, Any}()
    end

    # Make the metadata for this file
    d = OrderedDict{String, Any}()
    d["user"] = splitdir(homedir())[end]
    d["description"] = description
    d["time created"] = format(now(), dateformat"yyyy-mm-dd HH:MM:SS.sss")
    st = stacktrace()
    st_io = IOBuffer()
    for (i,_st) in enumerate(st)
        i == 1 && continue
        s = string(_st)
        if startswith(s, "top-level")
            println(st_io, "top-level scope at $(_st.file):$(_st.line)")
            break
        end
        println(st_io, s)
    end
    d["stack trace"] = String(take!(st_io))    

    # Check to see if there is already metadata for this file.  If so, save it to `previous`
    if haskey(meta, file)
        od = meta[file]
        if haskey(od, "previous")
            previous = pop!(od, "previous")
            push!(previous, od)
        else
            previous = [od]
        end
        d["previous"] = previous
    end
    meta[basename(file)] = d

    # Sort and save
    sort!(meta)
    YAML.write_file(meta_file, meta)
    return meta_file
end
export save_metadata


function blah()
    return stacktrace()
end
export blah