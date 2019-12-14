using MultiWriters
using Test

const io = IOBuffer()
const rd, wr = redirect_stderr()
@testset "MultiWriters.jl" begin
    mw = MultiWriter(io, stderr)
    mwprint(mw, "Hello", "World")
    helloworld = "HelloWorld"
    @test String(take!(io)) == helloworld
    @test String(readavailable(rd)) == helloworld

    mwwrite(mw, "Hello", "World")
    helloworld = "HelloWorld"
    @test String(take!(io)) == helloworld
    @test String(readavailable(rd)) == helloworld

    mwprintln(mw, "Hello", "World")
    helloworld = "HelloWorld\n"
    @test String(take!(io)) == helloworld
    @test String(readavailable(rd)) == helloworld

    mwshow(mw, "Hello")
    hello = "Hello"
    @test String(take!(io)) == sprint(show, hello)
    @test String(readavailable(rd)) == sprint(show, hello)
end
