module MultiWriters
export MultiWriter, mwprint, mwwrite, mwprintln, mwshow

struct MultiWriter <: IO
    writers::Tuple{Vararg{IO}}

    function MultiWriter(writers::IO...)
        new(writers)
    end
end

function _write(f::Function, ios, x...)
    for io in ios.writers
        f(io, x...)
    end
end

argtypes(m::Method) = fieldtypes(m.sig)

for f in [:write, :print, :println, :show]
    fnname = Symbol("mw", f)
    eval(quote
        function $(fnname)(io::MultiWriter, x...)
            _write($(f), io, x...)
        end
    end)
end

# for f in [:write, :print, :show]
#     ms = methods(eval(f)).ms
#     args_list = sizehint!(Set{Symbol}(), length(ms))
#     for m in ms
#         nargs = m.nargs
#         println(m)
#         args = argtypes(m)
#         fn_args = Symbol(join(["a_$(i)::$type" for (i, type) in enumerate(args[3:end])], ","))
#         push!(args_list, fn_args)
#     end

#     for arg in args_list
#         eval(quote
#             Base.$(f)(io::MultiWriter, $(arg)) = _write($(f), io, $(arg))
#         end)
#     end
# end

end # module
