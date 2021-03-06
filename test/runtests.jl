using Test
using E4STUtil

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
            @test usd_cr(1929, 2022, future=0.02) ≈ usd_cr(1929, 2021)*1.02
            @test usd_cr(1929, 2023, future=0.02) ≈ usd_cr(1929, 2021)*1.02*1.02
        end
    end
end