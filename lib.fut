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

def phase_gate (k: i32) : [2][2]comp =
    let theta = 2 * f32.pi / f32.i32 (2 ** k)
    let re = f32.cos theta
    let im = f32.sin theta
    in [[(1.0, 0.0), (0.0, 0.0)],
        [(0.0, 0.0), (re, im)]]

def inv_phase_gate (k: i32) : [2][2]comp =
    let theta = 2 * f32.pi / f32.i32 (2 ** k)
    let re = f32.cos theta
    let im = f32.sin theta
    in [[(1.0, 0.0), (0.0, 0.0)],
        [(0.0, 0.0), (re, -im)]]

def t_gate : [2][2]comp =
    phase_gate 3

def inv_t_gate : [2][2]comp =
    inv_phase_gate 3

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

-- note: benchmark if this should take k as an f32
def ctrl_phase_gate (k: i64) : [4][4]comp =
    let theta = 2 * f32.pi / f32.i64 (2 ** k)
    let re = f32.cos theta
    let im = f32.sin theta
    in [[(1.0, 0.0), (0.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
        [(0.0, 0.0), (1.0, 0.0), (0.0, 0.0), (0.0, 0.0)],
        [(0.0, 0.0), (0.0, 0.0), (1.0, 0.0), (0.0, 0.0)],
        [(0.0, 0.0), (0.0, 0.0), (0.0, 0.0), (re, im)  ]]

-- test syntax does not seem to support tuples,
-- so function for converting to array before comparing results
def convert (arr: *[]comp) : *[][2]f32 =
    map (\i -> [c.re i, c.im i]) arr

-- make quantom state with n qubits
entry make_ket (n: i64) : []comp =
    let n = 1 << n
    let ket = replicate n (c.mk 0 0)
    let ket[0] = c.mk_re 1
    in ket

-- applies 1-qubit quantom gate on qubit in n-qubit-state with varying position
def apply_gate [n] (s: [n]comp) (q: i64) (g: [2][2]comp) (pos: i64) : *[n]comp =
    map (\i ->
        let row  = (i >> (q - 1 - pos)) & 1 -- row index into gate matrix
        let mask = (1 << (q - 1 - pos))     -- mask with 1 at the pos bit
        let i0  = i & !mask                 -- set the pos bit in i to 0
        let i1  = i | mask                  -- set the pos bit in i to 1

        in s[i0] c.* g[row, 0] c.+ s[i1] c.* g[row, 1]
    ) (iota n)

-- applies 2-qubit quantom gate on qubit in n-qubit-state with varying position
def apply_gate2 [n] (s: [n]comp) (q: i64) (g: [4][4]comp) (pos1: i64) (pos2: i64) : *[n]comp =
    map (\i ->
        let bit1 = (i >> (q - 1 - pos1)) & 1 --
        let bit2 = (i >> (q - 1 - pos2)) & 1 --

        let row = bit1 << 1 | bit2           -- row index into gate matrix

        let mask1 = (1 << (q - 1 - pos1))    -- mask with 1 at the pos1 bit
        let mask2 = (1 << (q - 1 - pos2))    -- mask with 1 at the pos2 bit

        let i00 = (i & !mask1) & !mask2      -- set the pos bit in i to 0
        let i01 = (i & !mask1) | mask2       -- set the pos bit in i to 1
        let i10 = (i | mask1) & !mask2       --
        let i11 = (i | mask1) | mask2        --

        in s[i00] c.* g[row, 0] c.+ s[i01] c.* g[row, 1] c.+
           s[i10] c.* g[row, 2] c.+ s[i11] c.* g[row, 3]
    ) (iota n)


def apply_qft [n] (s: *[n]comp) (q: i64) : *[n]comp =
    let result = loop state = s for i < q do
        let state1 = apply_gate state q h_gate i
        let state2 = loop state = state1 for j in (i + 1)..<q do
            let phase = j - i + 1
            let gate = ctrl_phase_gate phase
            in apply_gate2 state q gate j i
        in state2

    let result1 = loop state = result for i < q / 2 do
        apply_gate2 state q swap_gate i (q - 1 - i)

    in result1

-- applies mcz with the control points being all qubits except the last which is the target
def apply_mcz [n] (s: *[n]comp) : *[n]comp =
    s with [n - 1] = s[n - 1] c.* (-1.0, 0.0)

def apply_phase_oracle [n] (s: *[n]comp) (q: i64) (mark: i64) : *[n]comp =
    let s = loop s = s for i < q do
        if ((mark >> i) & 1) == 0 then
            apply_gate s q x_gate i
        else
            s

    let s = apply_mcz s

    let s = loop s = s for i < q do
        if ((mark >> i) & 1) == 0 then
            apply_gate s q x_gate i
        else
            s

    in s

def apply_amplification [n] (s: *[n]comp) (q: i64) : *[n]comp =
    let s = loop s = s for i < q do
        apply_gate s q h_gate i
    let s = loop s = s for i < q do
        apply_gate s q x_gate i

    let s = apply_mcz s

    let s = loop s = s for i < q do
        apply_gate s q x_gate i
    let s = loop s = s for i < q do
        apply_gate s q h_gate i

    in s

def apply_grover [n] (s: *[n]comp) (q: i64) (mark: i64) : *[n]comp =
    let s = loop s = s for i < q do
        apply_gate s q h_gate i
    let s = apply_phase_oracle s q mark
    let s = apply_amplification s q
    in s

