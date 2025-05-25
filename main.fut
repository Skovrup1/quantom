import "lib"

-- test syntax does not seem to support tuples,
-- so function for converting to array before comparing results
def convert (arr: []comp) : [][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

-- ==
-- entry: qft
-- input { 24i64 }
-- auto output
entry qft (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = apply_qft ket q

    in (convert result)

-- ==
-- entry: grover
-- input { 24i64 }
-- auto output
entry grover (q: i64) : [][2]f32 =
  let ket = make_ket q
  let mark = 0
  let result = apply_grover ket q mark

  in (convert result)

entry main : i64 =
  0
