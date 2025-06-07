import "lib"

-- ==
-- entry: run_one
-- input { 10i64 }

-- ==
-- entry: run_one
-- input { 100i64 }

-- ==
-- entry: run_one
-- input { 1000i64 }

-- ==
-- entry: run_one
-- input { 10000i64 }

-- ==
-- entry: run_one
-- input { 100000i64 }

-- ==
-- entry: run_one
-- input { 1000000i64 }

-- ==
-- entry: run_two
-- input { 10i64 }

-- ==
-- entry: run_two
-- input { 100i64 }

-- ==
-- entry: run_two
-- input { 1000i64 }

-- ==
-- entry: run_two
-- input { 10000i64 }

-- ==
-- entry: run_two
-- input { 100000i64 }

-- ==
-- entry: run_three
-- input { 10i64 }

-- ==
-- entry: run_three
-- input { 100i64 }

-- ==
-- entry: run_three
-- input { 1000i64 }

-- ==
-- entry: run_three
-- input { 10000i64 }

-- ==
-- entry: run_three
-- input { 100000i64 }

entry run_one (iter: i64) : [][2]f32 =
    convert (one iter)

entry run_two (iter: i64) : [][2]f32 =
    convert (two iter)

entry run_three (iter: i64) : [][2]f32 =
    convert (three iter)

