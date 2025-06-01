import "lib"

-- ==
-- entry: one
-- input {}
-- auto output

-- ==
-- entry: two
-- input {}
-- auto output

-- ==
-- entry: three
-- input {}
-- auto output

-- ==
-- entry: qft
-- input { 30i64 }
-- auto output

-- ==
-- entry: qft
-- input { 29i64 }
-- auto output

-- ==
-- entry: qft
-- input { 28i64 }
-- auto output

-- ==
-- entry: qft
-- input { 27i64 }
-- auto output

-- ==
-- entry: qft
-- input { 26i64 }
-- auto output

-- ==
-- entry: qft
-- input { 25i64 }
-- auto output

-- ==
-- entry: qft
-- input { 24i64 }
-- auto output

-- ==
-- entry: qft
-- input { 23i64 }
-- auto output

-- ==
-- entry: qft
-- input { 22i64 }
-- auto output

-- ==
-- entry: qft
-- input { 21i64 }
-- auto output

-- ==
-- entry: qft
-- input { 20i64 }
-- auto output

-- ==
-- entry: qft
-- input { 19i64 }
-- auto output

-- ==
-- entry: qft
-- input { 18i64 }
-- auto output

-- ==
-- entry: qft
-- input { 17i64 }
-- auto output

-- ==
-- entry: qft
-- input { 16i64 }
-- auto output

-- ==
-- entry: qft
-- input { 15i64 }
-- auto output

-- ==
-- entry: qft
-- input { 14i64 }
-- auto output

-- ==
-- entry: qft
-- input { 13i64 }
-- auto output

-- ==
-- entry: qft
-- input { 12i64 }
-- auto output

-- ==
-- entry: qft
-- input { 11i64 }
-- auto output

-- ==
-- entry: qft
-- input { 10i64 }
-- auto output

-- ==
-- entry: qft
-- input { 9i64 }
-- auto output

-- ==
-- entry: qft
-- input { 8i64 }
-- auto output

-- ==
-- entry: qft
-- input { 7i64 }
-- auto output

-- ==
-- entry: qft
-- input { 6i64 }
-- auto output

-- ==
-- entry: qft
-- input { 5i64 }
-- auto output

-- ==
-- entry: qft
-- input { 4i64 }
-- auto output

-- ==
-- entry: qft
-- input { 3i64 }
-- auto output

-- ==
-- entry: qft
-- input { 2i64 }
-- auto output

-- ==
-- entry: qft
-- input { 1i64 }
-- auto output

-- ==
-- entry: grover
-- input { 30i64 }
-- auto output

-- ==
-- entry: grover
-- input { 29i64 }
-- auto output

-- ==
-- entry: grover
-- input { 28i64 }
-- auto output

-- ==
-- entry: grover
-- input { 27i64 }
-- auto output

-- ==
-- entry: grover
-- input { 26i64 }
-- auto output

-- ==
-- entry: grover
-- input { 24i64 }
-- auto output

-- ==
-- entry: grover
-- input { 23i64 }
-- auto output

-- ==
-- entry: grover
-- input { 22i64 }
-- auto output

-- ==
-- entry: grover
-- input { 21i64 }
-- auto output

-- ==
-- entry: grover
-- input { 20i64 }
-- auto output

-- ==
-- entry: grover
-- input { 19i64 }
-- auto output

-- ==
-- entry: grover
-- input { 18i64 }
-- auto output

-- ==
-- entry: grover
-- input { 17i64 }
-- auto output

-- ==
-- entry: grover
-- input { 16i64 }
-- auto output

-- ==
-- entry: grover
-- input { 15i64 }
-- auto output

-- ==
-- entry: grover
-- input { 14i64 }
-- auto output

-- ==
-- entry: grover
-- input { 13i64 }
-- auto output

-- ==
-- entry: grover
-- input { 12i64 }
-- auto output

-- ==
-- entry: grover
-- input { 11i64 }
-- auto output

-- ==
-- entry: grover
-- input { 10i64 }
-- auto output

-- ==
-- entry: grover
-- input { 9i64 }
-- auto output

-- ==
-- entry: grover
-- input { 8i64 }
-- auto output

-- ==
-- entry: grover
-- input { 7i64 }
-- auto output

-- ==
-- entry: grover
-- input { 6i64 }
-- auto output

-- ==
-- entry: grover
-- input { 5i64 }
-- auto output

-- ==
-- entry: grover
-- input { 4i64 }
-- auto output

-- ==
-- entry: grover
-- input { 3i64 }
-- auto output

-- ==
-- entry: grover
-- input { 2i64 }
-- auto output

-- ==
-- entry: grover
-- input { 1i64 }
-- auto output

entry qft (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = apply_qft ket q

    in convert result

entry grover (q: i64) : [][2]f32 =
  let ket = make_ket q
  let mark = 0b0
  let result = apply_grover ket q mark

  in convert result

entry one : [][2]f32 =
  let q = 1
  let ket = make_ket q

  let result = apply_gate ket q h_gate 0
  let result = apply_gate ket q x_gate 0
  let result = apply_gate ket q z_gate 0
  let result = apply_gate ket q y_gate 0
  let result = apply_gate ket q i_gate 0

  in convert result

entry two : [][2]f32 =
  let q = 2
  let ket = make_ket q

  let result = apply_gate ket q h_gate 0
  let result = apply_gate2 ket q cnot_gate 0 1
  let result = apply_gate ket q y_gate 0
  let result = apply_gate ket q x_gate 0
  let result = apply_gate2 ket q swap_gate 0 1
  let result = apply_gate ket q i_gate 0
  let result = apply_gate ket q z_gate 0

  in convert result

entry three : [][2]f32 =
  let q = 3
  let ket = make_ket q

  let result = apply_gate ket q h_gate 0
  let result = apply_gate ket q i_gate 1
  let result = apply_gate ket q i_gate 2
  let result = apply_gate2 ket q cnot_gate 0 1
  let result = apply_gate ket q i_gate 2
  let result = apply_gate ket q y_gate 0
  let result = apply_gate2 ket q cnot_gate 1 2
  let result = apply_gate ket q i_gate 0
  let result = apply_gate ket q z_gate 1
  let result = apply_gate ket q x_gate 2
  let result = apply_gate2 ket q swap_gate 0 1
  let result = apply_gate ket q i_gate 2
  let result = apply_gate ket q h_gate 0
  let result = apply_gate ket q h_gate 1
  let result = apply_gate ket q h_gate 2
  let result = apply_gate2 ket q cnot_gate 2 0
  let result = apply_gate ket q x_gate 0
  let result = apply_gate ket q y_gate 1
  let result = apply_gate ket q z_gate 2

  in convert result
