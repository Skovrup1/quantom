import "lib"

entry main : []comp =
    let ket = make_ket 3
    let result = apply_gate h_gate ket 0
    let result' = apply_gate h_gate result 1

    in result'
