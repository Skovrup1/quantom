import "lib"

-- test syntax does not seem to support tuples,
-- so function for converting to array before comparing results
def convert (arr: *[]comp) : *[][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

-- ==
-- entry: qft
-- input { 26i64 }
-- auto output
entry qft (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = apply_qft ket q

    in convert result

-- ==
-- entry: grover
-- input { 26i64 }
-- auto output
entry grover (q: i64) : [][2]f32 =
  let ket = make_ket q
  let mark = 0b0
  let result = apply_grover ket q mark

  in convert result

entry main : [][2]f32 =
  let q = 3
  let ket = make_ket q

  let result = map (c.+ (1.0, 0.0)) ket

  in convert result
