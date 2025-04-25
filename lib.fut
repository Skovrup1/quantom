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
