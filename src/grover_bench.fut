import "lib"

-- ==
-- entry: grover
-- input { 24i64 }

-- ==
-- entry: grover
-- input { 23i64 }

-- ==
-- entry: grover
-- input { 22i64 }

-- ==
-- entry: grover
-- input { 21i64 }

-- ==
-- entry: grover
-- input { 20i64 }

-- ==
-- entry: grover
-- input { 19i64 }

-- ==
-- entry: grover
-- input { 18i64 }

-- ==
-- entry: grover
-- input { 17i64 }

-- ==
-- entry: grover
-- input { 16i64 }

-- ==
-- entry: grover
-- input { 15i64 }

-- ==
-- entry: grover
-- input { 14i64 }

-- ==
-- entry: grover
-- input { 13i64 }

-- ==
-- entry: grover
-- input { 12i64 }

-- ==
-- entry: grover
-- input { 11i64 }

-- ==
-- entry: grover
-- input { 10i64 }

-- ==
-- entry: grover
-- input { 9i64 }

-- ==
-- entry: grover
-- input { 8i64 }

-- ==
-- entry: grover
-- input { 7i64 }

-- ==
-- entry: grover
-- input { 6i64 }

-- ==
-- entry: grover
-- input { 5i64 }

-- ==
-- entry: grover
-- input { 4i64 }

-- ==
-- entry: grover
-- input { 3i64 }

-- ==
-- entry: grover
-- input { 2i64 }

-- ==
-- entry: grover
-- input { 1i64 }

-- ==
-- entry: grover_fused
-- input { 24i64 }

-- ==
-- entry: grover_fused
-- input { 23i64 }

-- ==
-- entry: grover_fused
-- input { 22i64 }

-- ==
-- entry: grover_fused
-- input { 21i64 }

-- ==
-- entry: grover_fused
-- input { 20i64 }

-- ==
-- entry: grover_fused
-- input { 19i64 }

-- ==
-- entry: grover_fused
-- input { 18i64 }

-- ==
-- entry: grover_fused
-- input { 17i64 }

-- ==
-- entry: grover_fused
-- input { 16i64 }

-- ==
-- entry: grover_fused
-- input { 15i64 }

-- ==
-- entry: grover_fused
-- input { 14i64 }

-- ==
-- entry: grover_fused
-- input { 13i64 }

-- ==
-- entry: grover_fused
-- input { 12i64 }

-- ==
-- entry: grover_fused
-- input { 11i64 }

-- ==
-- entry: grover_fused
-- input { 10i64 }

-- ==
-- entry: grover_fused
-- input { 9i64 }

-- ==
-- entry: grover_fused
-- input { 8i64 }

-- ==
-- entry: grover_fused
-- input { 7i64 }

-- ==
-- entry: grover_fused
-- input { 6i64 }

-- ==
-- entry: grover_fused
-- input { 5i64 }

-- ==
-- entry: grover_fused
-- input { 4i64 }

-- ==
-- entry: grover_fused
-- input { 3i64 }

-- ==
-- entry: grover_fused
-- input { 2i64 }

-- ==
-- entry: grover_fused
-- input { 1i64 }

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
