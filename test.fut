import "lib"

-- test syntax does not seem to support tuples,
-- so function for converting to array before comparing results
def convert (arr: []comp) : [][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

--
-- 1-qubit gates
--

-- Applying 1-qubit H gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_hgate_1_0
-- input { 0i64 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32]] }

entry test_hgate_1_0 (pos: i64) : [][2]f32 =
    let q = 1
    let ket = make_ket q
    let result = apply_gate ket q (copy h_gate) pos
    in convert result

-- Applying 1-qubit I gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_igate_1
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_1 (pos: i64) : [][2]f32 =
    let q = 1
    let ket = make_ket q
    let result = apply_gate ket q (copy i_gate) pos
    in convert result

-- Applying 1-qubit X gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_xgate_1
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32]] }

entry test_xgate_1 (pos: i64) : [][2]f32 =
    let q = 1
    let ket = make_ket q
    let result = apply_gate ket q (copy x_gate) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_ygate_1
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32]] }

entry test_ygate_1 (pos: i64) : [][2]f32 =
    let q = 1
    let ket = make_ket q
    let result = apply_gate ket q (copy y_gate) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_zgate_1
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_1 (pos: i64) : [][2]f32 =
    let q = 1
    let ket = make_ket q
    let result = apply_gate ket q (copy z_gate) pos
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
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy h_gate) pos
    in convert result

-- Applying 1-qubit I gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_igate_12
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_12 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy i_gate) pos
    in convert result

-- Applying 1-qubit X gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_xgate_12
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_xgate_12 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy x_gate) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_ygate_12
-- input { 0i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 1.0f32], [0.0f32, 0.0f32]] }

entry test_ygate_12 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy y_gate) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_zgate_12
-- input { 0i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_12 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy z_gate) pos
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
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy h_gate) pos
    in convert result

-- Applying 1-qubit I gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_igate_22
-- input { 1i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_22 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy i_gate) pos
    in convert result

-- Applying 1-qubit X gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_xgate_22
-- input { 1i64 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_xgate_22 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy x_gate) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_ygate_22
-- input { 1i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_ygate_22 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy y_gate) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_zgate_22
-- input { 1i64 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_22 (pos: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result = apply_gate ket q (copy z_gate) pos
    in convert result

--
-- Consequtive gates
--

-- X gate followed by X gate
-- ==
-- entry: test_xgate_222
-- input { 0i64 1i64 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [1.0f32, 0.0f32]] }
entry test_xgate_222 (pos1: i64) (pos2: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result  = apply_gate ket    q (copy x_gate) pos1
    let result1 = apply_gate result q (copy x_gate) pos2
    in convert result1

-- H gate followed by H gate
-- ==
-- entry: test_hgate_222
-- input { 0i64 1i64 }
-- output { [[0.5f32, 0.0f32], [0.5f32, 0.0f32], [0.5f32, 0.0f32], [0.5f32, 0.0f32]] }
entry test_hgate_222 (pos1: i64) (pos2: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result  = apply_gate ket    q (copy h_gate) pos1
    let result1 = apply_gate result q (copy h_gate) pos2
    in convert result1

--
-- 2-qubit gates
--

--
-- Consequtive gates
--

-- H gate followed by SWAP gate on 2-qubit state
-- ==
-- entry: test_hswap_2_01
-- input { 0i64 0i64 1i64 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }
entry test_hswap_2_01 (pos1: i64) (pos2: i64) (pos3: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result  = apply_gate  ket    q (copy h_gate)    pos1
    let result1 = apply_gate2 result q (copy swap_gate) pos2 pos3
    in convert result1


-- xgate followed by 2 cnot gates on 2-qubit state
-- ==
-- entry: test_x_cnot_2_01
-- input { 0i64 0i64 1i64 1i64 0i64 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }
entry test_x_cnot_2_01 (pos1: i64) (pos2: i64) (pos3: i64) (pos4: i64) (pos5: i64) : [][2]f32 =
    let q = 2
    let ket = make_ket q
    let result  = apply_gate  ket     q (copy x_gate)    pos1
    let result1 = apply_gate2 result  q (copy cnot_gate) pos2 pos3
    let result2 = apply_gate2 result1 q (copy cnot_gate) pos4 pos5
    in convert result2
