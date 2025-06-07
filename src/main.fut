import "lib"

-- ==
-- entry: grover
-- input { 10i64 }

-- ==
-- entry: grover
-- input { 12i64 }

-- ==
-- entry: grover
-- input { 14i64 }

-- ==
-- entry: grover
-- input { 16i64 }

-- ==
-- entry: grover
-- input { 18i64 }

-- ==
-- entry: grover_fused
-- input { 10i64 }

-- ==
-- entry: grover_fused
-- input { 12i64 }

-- ==
-- entry: grover_fused
-- input { 14i64 }

-- ==
-- entry: grover_fused
-- input { 16i64 }

-- ==
-- entry: grover_fused
-- input { 18i64 }

entry grover (q: i64) : [][2]f32 =
    let ket = make_ket q
    let mark = 0b0
    let result = apply_grover ket q mark

    in convert result

entry grover_fused (q: i64) : [][2]f32 =
    let ket = make_ket q
    let mark = 0b0
    let result = apply_grover_fused ket q mark

    in convert result
