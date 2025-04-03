import "lib/github.com/diku-dk/complex/complex"

module c = mk_complex f32

type comp = c.complex

def h_gate : [2][2]comp =
    let h = 1.0 / (f32.sqrt 2.0)
    in [[(h, 0.0), (h, 0.0)],
        [(h, 0.0), (-h, 0.0)]]

def i_gate : [2][2]comp =
    [[(1.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (1.0, 0.0)]]

def x_gate : [2][2]comp =
    [[(0.0, 0.0), (1.0, 0.0)],
     [(1.0, 0.0), (0.0, 0.0)]]

def y_gate : [2][2]comp =
    [[(0.0, 0.0), (0.0, -1.0)],
     [(0.0, 1.0), (0.0, 0.0)]]

def z_gate : [2][2]comp =
    [[(1.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (-1.0, 0.0)]]

def cnot_gate : [4][4]comp =
    [[(1.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (1.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (1.0, 0.0)],
     [(0.0, 0.0), (0.0, 0.0), (1.0, 0.0), (0.0, 0.0)]]

def ctrlz_gate : [4][4]comp =
    [[(1.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (1.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (0.0, 0.0), (1.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (-1.0, 0.0)]]

def swap_gate : [4][4]comp =
    [[(1.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (0.0, 0.0), (1.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (1.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (1.0, 0.0)]]

-- make quantom state with n qubits
entry make_ket (n: i64) : []comp =
    let n = 1 << n
    let ket = replicate n (c.mk 0 0)
    let ket[0] = c.mk_re 1
    in ket

def iota_i32 (n: i64) : [n]i32 =
    map i32.i64 (iota n)

-- [[1, 2], [3, 4]] = [1,2,3,4]

-- applies 1-qubit quantom gate on qubit in n-qubit-state
def apply_gate [n] (g: [2][2]comp) (s: [n]comp) (pos: i32) : [n]comp =
    map (\k ->
        let i = k / 2
        let j = k % 2
        in (g[j, 0] c.* s[i * 2]) c.+ (g[i, 1] c.* s[i * 2 + 1])
    ) (iota_i32 n)

entry main : []comp =
    let ket = make_ket 2
    let result = apply_gate x_gate ket 0
    let result = apply_gate x_gate ket 1

    in result

--
-- tests
--

-- test syntax does not support tuples, so converts to array
def convert (arr: []comp) : [][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

--
-- 1-qubit gates
--

-- Applying 1-qubit H gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_hgate_1
-- input { 0 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32]] }

entry test_hgate_1 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit I gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_igate_1
-- input { 0 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_1 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy i_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit X gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_xgate_1
-- input { 0 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32]] }

entry test_xgate_1 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_ygate_1
-- input { 0 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32]] }

entry test_ygate_1 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy y_gate) (make_ket 1) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 1 in 1-qubit-state
-- ==
-- entry: test_zgate_1
-- input { 0 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_1 (pos: i32) : [][2]f32 =
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
-- input { 0 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_hgate_12 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit I gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_igate_12
-- input { 0 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_12 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy i_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit X gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_xgate_12
-- input { 0 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_xgate_12 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_ygate_12
-- input { 0 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_ygate_12 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy y_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 1 in 2-qubit-state
-- ==
-- entry: test_zgate_12
-- input { 0 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_12 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy z_gate) (make_ket 2) pos
    in convert result

--
-- position 2
--

-- Applying 1-qubit H gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_hgate_22
-- input { 1 }
-- output { [[0.70710677f32, 0.0f32], [0.70710677f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_hgate_22 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy h_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit I gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_igate_22
-- input { 1 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_igate_22 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy i_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit X gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_xgate_22
-- input { 1 }
-- output { [[0.0f32, 0.0f32], [1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_xgate_22 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy x_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Y gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_ygate_22
-- input { 1 }
-- output { [[0.0f32, 0.0f32], [0.0f32, 1.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_ygate_22 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy y_gate) (make_ket 2) pos
    in convert result

-- Applying 1-qubit Z gate on qubit 2 in 2-qubit-state
-- ==
-- entry: test_zgate_22
-- input { 1 }
-- output { [[1.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32], [0.0f32, 0.0f32]] }

entry test_zgate_22 (pos: i32) : [][2]f32 =
    let result = apply_gate (copy z_gate) (make_ket 2) pos
    in convert result

--
-- 2-qubit gates
--
