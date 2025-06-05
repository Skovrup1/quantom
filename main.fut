import "lib"

-- ==
-- entry: main
-- input { 20i64 }

entry main (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = loop result = ket for i < q do
        apply_gate result q h_gate i

    in convert result
