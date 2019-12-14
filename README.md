# MultiWriters

[![Build Status](https://travis-ci.com/goropikari/MultiWriters.jl.svg?branch=master)](https://travis-ci.com/goropikari/MultiWriters.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/goropikari/MultiWriters.jl?svg=true)](https://ci.appveyor.com/project/goropikari/MultiWriters-jl)
[![Codecov](https://codecov.io/gh/goropikari/MultiWriters.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/goropikari/MultiWriters.jl)

# Installation
```
using Pkg
Pkg.pkg"add "
```

# Usage

```
julia> using MultiWriters

julia> io = IOBuffer()
IOBuffer(data=UInt8[...], readable=true, writable=true, seekable=true, append=false, size=0, maxsize=Inf, ptr=1, mark=-1)

julia> mw = MultiWriter(stdout, io)
MultiWriter((Base.TTY(RawFD(0x0000000d) open, 0 bytes waiting), IOBuffer(data=UInt8[...], readable=true, writable=true, seekable=true, append=false, size=0, maxsize=Inf, ptr=1, mark=-1)))

julia> mwprint(mw, "Hello World!", " foo")
Hello World! foo
julia> String(take!(io))
"Hello World! foo"
```
