using Test
using E4STUtil

@testset "Test E4STUtil" begin
    @testset "Test USD conversion rate" begin
        @test usd_cr(1929, 2021) > 1
        @test usd_cr(2021, 1929) < 1
        @test_throws Exception usd_cr(1900, 2021)
        @test_throws Exception usd_cr(2021, 1900)
    end
end