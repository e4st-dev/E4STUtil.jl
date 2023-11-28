
"""
    register_e4st_dep(name, message, remote_path, args...; kwargs...)

See documentation for `DataDeps.DataDep` for more info, but the required fields are:
* name - the name of the metadata.  Later, access using `datadep"<name>"` or [`get_e4st_dep`](@ref)
* message - the message to store in metadata.  A description of where the data came from, the size, etc.
* remote_path - where to fetch the data from.  
"""
function register_e4st_dep(name, message, remote_path, args...; kwargs...)
    dep = DataDep(name, message, remote_path, args...; kwargs...)
    register(dep)
    add_md = (DataDeps.try_determine_load_path(name, "") === nothing)
    file = @datadep_str(name)

    # add_md && save_dep_metadata(file, name, message, remote_path)
    save_dep_metadata(file, name, message, remote_path)
end
export register_e4st_dep

"""
    save_dep_metadata(file::String, message::String) -> metadata

Saves metadata for `file` to `joinpath(dirname(file), "metadata.yml")`, making it if needed.
"""
function save_dep_metadata(file::String, name, message::String, remote_path)
    meta_file = joinpath(dirname(file), "../metadata.yml")

    if isfile(meta_file)
        meta = YAML.load_file(meta_file, dicttype=OrderedDict{String, Any})
    else
        meta = OrderedDict{String, Any}()
    end

    # Make the metadata for this file
    d = OrderedDict{String, Any}()
    d["user"] = splitdir(homedir())[end]
    d["remote_path"] = remote_path
    d["time_created"] = format(now(), dateformat"yyyy-mm-dd HH:MM:SS.sss")
    
    # Save the file that called this function.
    d["caller_file"] = get_caller_file()
    
    d["description"] = message
    
    meta[name] = d

    # Sort and save
    sort!(meta)
    YAML.write_file(meta_file, meta)
    return meta_file
end
export save_metadata

function get_caller_file()
    st = stacktrace()
    for sf in st
        contains(string(sf.file), "E4STUtil") || return replace(string(sf.file), "\\"=>"/")
    end
    return ""
end

"""
    get_e4st_dep(name) -> file

Returns the e4st dependency that has been registered via [`register_e4st_dep`](@ref).  Can also use `datadep"<name>"`
"""
function get_e4st_dep(name)
    return @datadep_str(name)
end
export get_e4st_dep
export @datadep_str
