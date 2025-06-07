import "lib"

-- ==
-- entry: qft
-- input { 30i64 }

-- ==
-- entry: qft
-- input { 29i64 }

-- ==
-- entry: qft
-- input { 28i64 }

-- ==
-- entry: qft
-- input { 27i64 }

-- ==
-- entry: qft
-- input { 26i64 }

-- ==
-- entry: qft
-- input { 25i64 }

-- ==
-- entry: qft
-- input { 24i64 }

-- ==
-- entry: qft
-- input { 23i64 }

-- ==
-- entry: qft
-- input { 22i64 }

-- ==
-- entry: qft
-- input { 21i64 }

-- ==
-- entry: qft
-- input { 20i64 }

-- ==
-- entry: qft
-- input { 19i64 }

-- ==
-- entry: qft
-- input { 18i64 }

-- ==
-- entry: qft
-- input { 17i64 }

-- ==
-- entry: qft
-- input { 16i64 }

-- ==
-- entry: qft
-- input { 15i64 }

-- ==
-- entry: qft
-- input { 14i64 }

-- ==
-- entry: qft
-- input { 13i64 }

-- ==
-- entry: qft
-- input { 12i64 }

-- ==
-- entry: qft
-- input { 11i64 }

-- ==
-- entry: qft
-- input { 10i64 }

-- ==
-- entry: qft
-- input { 9i64 }

-- ==
-- entry: qft
-- input { 8i64 }

-- ==
-- entry: qft
-- input { 7i64 }

-- ==
-- entry: qft
-- input { 6i64 }

-- ==
-- entry: qft
-- input { 5i64 }

-- ==
-- entry: qft
-- input { 4i64 }

-- ==
-- entry: qft
-- input { 3i64 }

-- ==
-- entry: qft
-- input { 2i64 }

-- ==
-- entry: qft
-- input { 1i64 }

entry qft (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = apply_qft ket q

    in convert result
