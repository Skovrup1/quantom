import "lib"

-- ==
-- entry: qft
-- input { 31i64 }

-- ==
-- ==
-- entry: qft
-- input { 30i64 }

-- ==
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

-- ==
-- entry: grover
-- input { 30i64 }

-- ==
-- entry: grover
-- input { 29i64 }

-- ==
-- entry: grover
-- input { 28i64 }

-- ==
-- entry: grover
-- input { 27i64 }

-- ==
-- entry: grover
-- input { 26i64 }

-- ==
-- entry: grover
-- input { 25i64 }

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

entry qft (q: i64) : [][2]f32 =
    let ket = make_ket q
    let result = apply_qft ket q

    in convert result

entry grover (q: i64) : [][2]f32 =
    let ket = make_ket q
    let mark = 0b0
    let result = apply_grover ket q mark

    in convert result

entry run_one (iter: i64) : [][2]f32 =
    convert (one iter)

entry run_two (iter: i64) : [][2]f32 =
    convert (two iter)

entry run_three (iter: i64) : [][2]f32 =
    convert (three iter)

