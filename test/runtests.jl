using Test
using E4STUtil
using YAML

import E4STUtil.save_dep_metadata

@testset "Test E4STUtil" begin
    @testset "Test USD conversion rate" begin
        @testset "Test Default Behavior" begin
            @test usd_cr(1929, 2021) > 1
            @test usd_cr(2021, 1929) < 1
            @test_throws Exception usd_cr(1900, 2021)
            @test_throws Exception usd_cr(2021, 1900)
        end
        @testset "Test sources" begin
            @test usd_cr(1929, 2021, source=gdp) > 1
            @test usd_cr(1929, 2021, source=cpi) > 1
            @test usd_cr(2021, 1929, source=gdp) < 1
            @test usd_cr(2021, 1929, source=cpi) < 1
        end
        @testset "Test future" begin
            @test usd_cr(1929, 2025, future=0.02) ≈ usd_cr(1929, 2024)*1.02
            @test usd_cr(1929, 2026, future=0.02) ≈ usd_cr(1929, 2024)*1.02*1.02
        end
    end
    @testset "Test saving metadata" begin
        md_file = save_metadata("myfile.md", "This is a test file")
        save_metadata("myfile.md", "This is the same test file, overwriting")
        save_metadata("myfile.md", "This is the same test file, overwriting")
        save_metadata("anotherfile.md", "This is another test file")

        meta = YAML.load_file(md_file)

        @test haskey(meta, "myfile.md")
        @test haskey(meta, "anotherfile.md")
        @test haskey(meta["myfile.md"], "previous")
        @test length(meta["myfile.md"]["previous"]) == 2
        rm(md_file)
    end

    @testset "Test saving metadata for data deps" begin
        md_file = save_dep_metadata(joinpath(@__DIR__, "myfile"), "myname", "my message", "my remote path")
        save_dep_metadata(joinpath(@__DIR__, "myfile"), "myname", "my message new", "my remote path new")
        save_dep_metadata(joinpath(@__DIR__, "myfile"), "myname2", "my message", "my remote path")

        meta = YAML.load_file(md_file)
        @test haskey(meta, "myname")
        @test haskey(meta, "myname2")
        @test meta["myname"]["description"] == "my message new"
        @test meta["myname"]["remote_path"] == "my remote path new" 
        @test meta["myname2"]["description"] == "my message"
        @test meta["myname2"]["remote_path"] == "my remote path" 
    end
end
