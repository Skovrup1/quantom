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

-- applies 1-qubit quantom gate on qubit in n-qubit-state with varying position
def apply_gate [n] (g: [2][2]comp) (s: [n]comp) (pos: i64) : [n]comp =
  let q = i64.i32 (i64.ctz n) -- number of qubits, should this be a parameter instead?

  in map (\i ->
    let row  = (i >> (q - 1 - pos)) & 1 -- row index into gate matrix
    let mask = (1 << (q - 1 - pos))     -- mask with 1 at the pos bit
    let j = i & !mask                   -- set the pos bit in i to 0
    let k = i | mask                    -- set the pos bit in i to 1

    in s[j] c.* g[row, 0] c.+ s[k] c.* g[row, 1]
  ) (iota n)

-- OLD!! applies 1-qubit quantom gate on qubit in n-qubit-state with fixed position = 1
def apply_gate_ex_low [n] (g: [2][2]comp) (s: [n]comp) (pos: i64) : [n]comp =
  map (\i ->
    let i_n  = (i >> 1) & 1
    let idx0 = i & 1
    let idx1 = idx0 + 2

    in s[idx0] c.* g[i_n, 0] c.+ s[idx1] c.* g[i_n, 1]
  ) (iota n)

-- OLD!! applies 1-qubit quantom gate on qubit in n-qubit-state with fixed position = 2
def apply_gate_ex_high [n] (g: [2][2]comp) (s: [n]comp) (pos: i64) : [n]comp =
  map (\i ->
    let i_n  = i & 1
    let idx0 = ((i >> 1) & 1) * 2
    let idx1 = idx0 + 1

    in s[idx0] c.* g[i_n, 0] c.+ s[idx1] c.* g[i_n, 1]
  ) (iota n)

entry main : []comp =
    let ket = make_ket 3
    let result = apply_gate h_gate ket 0
    let result' = apply_gate h_gate result 1

    in result'

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
