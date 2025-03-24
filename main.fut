import "lib/github.com/diku-dk/complex/complex"

module c = mk_complex f32

type comp = c.complex

def h_gate : [2][2]comp =
    let h = 1.0 / (f32.sqrt 2.0)

    in [[(h, 0.0), (h, 0.0)],
        [(h, 0.0), (-h, 0.0)]]

def x_gate : [2][2]comp =
    [[(0.0, 0.0), (1.0, 0.0)],
     [(1.0, 0.0), (0.0, 0.0)]]

def y_gate : [2][2]comp =
    [[(0.0, 0.0), (0.0, -1.0)],
     [(0.0, 1.0), (0.0, 0.0)]]

def z_gate : [2][2]comp =
    [[(1.0, 0.0), (0.0, 0.0)],
     [(0.0, 0.0), (-1.0, 0.0)]]

let apply_gate [n] (g: [2][2]comp) (s: [n]comp) (pos: i32) : [n]comp =
    map (\i ->
        let bit = i >> pos & 1
        let i0 = i & !(1 << pos)
        let i1 = i0 | (1 << pos)

        in (g[bit, 0] c.* s[i0]) c.+ (g[bit,1] c.* s[i1])
    ) (map i32.i64 (iota n))

entry main : []comp =
    let ket: []comp = [
            (1.0, 0.0),
            (0.0, 0.0),
            (0.0, 0.0),
            (0.0, 0.0),
            (0.0, 0.0),
            (0.0, 0.0),
            (0.0, 0.0),
            (0.0, 0.0),
        ]

    let result = apply_gate y_gate ket 2

    in result
