import "lib"

-- test syntax does not seem to support tuples,
-- so function for converting to array before comparing results
def convert (arr: []comp) : [][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

-- ==
-- input { 16i64 }
-- auto output

entry main (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = apply_qft ket

    in (convert result)
