import "lib"

-- test syntax does not support tuples, so converts to array
def convert (arr: []comp) : [][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

--
-- 1-qubit gates
--

-- Applying 1-qubit H gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_hgate_1
-- input { 0i64 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32]] }

entry test_hgate_1 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit I gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_igate_1
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_1 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy i_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit X gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_xgate_1
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32]] }

entry test_xgate_1 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_ygate_1
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32]] }

entry test_ygate_1 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy y_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_zgate_1
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_1 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy z_gate) (make_ket 1) pos
    in convert result

--
-- 2-qubit states
--

--
-- position 1
--

-- Applying 1-qubit H gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_hgate_12
-- input { 0i64 }
-- output { [[0.70710677f32, 0.0f32], [0.0f32, 0.0f32], [0.70710677f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_hgate_12 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit I gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_igate_12
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_12 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy i_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit X gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_xgate_12
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_xgate_12 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_ygate_12
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 1.0f32], [0.0f32, 0.0f32]] }

entry test_ygate_12 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy y_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_zgate_12
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_12 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy z_gate) (make_ket 2) pos
    in convert result

--
-- position 2
--

-- Applying 1-qubit H gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_hgate_22
-- input { 1i64 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_hgate_22 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit I gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_igate_22
-- input { 1i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_22 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy i_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit X gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_xgate_22
-- input { 1i64 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_xgate_22 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_ygate_22
-- input { 1i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_ygate_22 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy y_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_zgate_22
-- input { 1i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_22 (pos: i64) : [][2]f32 =
    let result = apply_gate (copy z_gate) (make_ket 2) pos
    in convert result

--
-- Consequtive gates
--

-- TODO: description
-- ==
-- entry: test_xgate_222
-- input { 0i64 1i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [1.0f32, 0.0f32]] }
entry test_xgate_222 (pos1: i64) (pos2: i64) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 2) pos1
    let result' = apply_gate (copy x_gate) result pos2
    in convert result'

-- TODO: description
-- ==
-- entry: test_hgate_222
-- input { 0i64 1i64 }
-- output { [[0.5f32, 0.0f32], [0.5f32, 0.0f32], [0.5f32, 0.0f32], [0.5f32, 0.0f32]] }
entry test_hgate_222 (pos1: i64) (pos2: i64) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 2) pos1
    let result' = apply_gate (copy h_gate) result pos2
    in convert result'

--
-- 2-qubit gates
--
