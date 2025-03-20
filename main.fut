import "lib/github.com/diku-dk/complex/complex"

module c = mk_complex f32

type comp = c.complex

def pauli_gate : [2][2]comp =
    [[(0.0, 0.0), (1.0, 0.0)],
     [(1.0, 0.0), (0.0, 0.0)]]

def hadamard_gate : [2][2]comp =
    [[(0.5, 0.0), (0.5, 0.0)],
     [(0.5, 0.0), (-0.5, 0.0)]]

let apply_gate (g: [2][2]comp) (s: [2][2]comp) : [2][2]comp =
    map (\i ->
        map (\j ->
            s[i, 0] c.* g[j, 0] c.+
            s[i, 1] c.* g[i, 1]
        ) (iota 2)
    ) (iota 2)

entry main : [][]comp =
    let n = 2
    let ket: [2][2]comp = [[(1.0, 0.0), (0.0, 0.0)],
                           [(0.0, 0.0), (0.0, 0.0)]]

    let result = apply_gate hadamard_gate ket

    in result
