import "lib"

entry main : [][2]f32 =
  let q = 3
  let ket = make_ket q

  let result = map (c.+ (1.0, 0.0)) ket

  in convert result
