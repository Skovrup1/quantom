import cirq
import qsimcirq
import numpy as np
import math
import time

def print_state(v):
    for i, amp in enumerate(v.final_state_vector):
        print(f"|{i:3d}| {amp.real:.6f}{amp.imag:+.6f}j")

def one(n):
    qubits = cirq.LineQubit.range(1)
    circuit = cirq.Circuit()

    for _ in range(n):
        circuit.append(cirq.H(qubits[0]))
        circuit.append(cirq.X(qubits[0]))
        circuit.append(cirq.Z(qubits[0]))
        circuit.append(cirq.Y(qubits[0]))
        circuit.append(cirq.I(qubits[0]))

    return circuit

def two(n):
    qubits = cirq.LineQubit.range(2)
    circuit = cirq.Circuit()

    for _ in range(n):
        circuit.append(cirq.H(qubits[0]))
        circuit.append(cirq.CX(qubits[0], qubits[1]))
        circuit.append(cirq.Y(qubits[0]))
        circuit.append(cirq.X(qubits[1]))
        circuit.append(cirq.SWAP(qubits[0], qubits[1]))
        circuit.append(cirq.I(qubits[0]))
        circuit.append(cirq.Z(qubits[1]))

    return circuit

def three(n):
    qubits = cirq.LineQubit.range(3)
    circuit = cirq.Circuit()

    for _ in range(n):
        circuit.append(cirq.H(qubits[0]))
        circuit.append(cirq.I(qubits[1]))
        circuit.append(cirq.I(qubits[2]))
        circuit.append(cirq.CX(qubits[0], qubits[1]))
        circuit.append(cirq.I(qubits[2]))
        circuit.append(cirq.Y(qubits[0]))
        circuit.append(cirq.CX(qubits[1], qubits[2]))
        circuit.append(cirq.I(qubits[0]))
        circuit.append(cirq.Z(qubits[1]))
        circuit.append(cirq.X(qubits[2]))
        circuit.append(cirq.SWAP(qubits[0], qubits[1]))
        circuit.append(cirq.I(qubits[2]))
        circuit.append(cirq.H(qubits[0]))
        circuit.append(cirq.H(qubits[1]))
        circuit.append(cirq.H(qubits[2]))
        circuit.append(cirq.CX(qubits[2], qubits[0]))
        circuit.append(cirq.X(qubits[0]))
        circuit.append(cirq.Y(qubits[1]))
        circuit.append(cirq.Z(qubits[2]))

    return circuit

def grover(n = 3, mark = 3):
    qubits = cirq.LineQubit.range(n)
    circuit = cirq.Circuit()
    mcz = cirq.Z.controlled(n - 1)

    circuit.append(cirq.H.on_each(qubits))

    for i, qubit in enumerate(qubits):
        if ((mark >> i) & 1) == 0:
            circuit.append(cirq.X(qubit))

    circuit.append(mcz(*qubits))

    for i, qubit in enumerate(qubits):
        if ((mark >> i) & 1) == 0:
            circuit.append(cirq.X(qubit))


    for _ in range(math.floor((math.pi / 4) * math.sqrt(2 ** n))):
        circuit.append(cirq.H.on_each(qubits))
        circuit.append(cirq.X.on_each(qubits))

        circuit.append(mcz(*qubits))

        circuit.append(cirq.X.on_each(qubits))
        circuit.append(cirq.H.on_each(qubits))

    return circuit


def qft(n = 3):
    qubits = cirq.LineQubit.range(n)
    circuit = cirq.Circuit()

    for i in range(n):
        circuit.append(cirq.H(qubits[i]))
        for j in range(i + 1, n):
            phase = j - i + 1
            gate = cirq.CZPowGate(exponent=phase)
            circuit.append(gate(qubits[j], qubits[i]))

    for i in range (n // 2):
        circuit.append(cirq.SWAP(qubits[i], qubits[n - 1 - i]))

    return circuit

def benchmark_circuits(circuits, num_runs=1, warmup_runs=0, simulator = None):
    results = {}

    for name, circuit in circuits.items():
        print(f"\nbenchmarking {name}")

        for _ in range(warmup_runs):
            simulator.simulate(circuit)

        time_data = []
        for _ in range(num_runs):
            start_time = time.time()
            simulator.simulate(circuit)
            end_time = time.time()
            time_data.append(end_time - start_time)

        avg_time = np.mean(time_data)
        std_time = np.std(time_data)
        results[name] = {'average_time': avg_time, 'std_dev': std_time}
        print(f"{name}: average time = {avg_time:.4f} seconds, std dev = {std_time:.4f} seconds")

    return results

options = {'t': 64} # how many threads to use
simulator = qsimcirq.QSimSimulator(options)

circuits = {
    "one-qubit-10":       one(10),
    "one-qubit-100":      one(100),
    "one-qubit-1000":     one(1000),
    "one-qubit-10000":    one(10000),
    "one-qubit-100000":   one(100001),
    "one-qubit-1000000":  one(1000000),
    "two-qubit-10":       two(10),
    "two-qubit-100":      two(100),
    "two-qubit-1000":     two(1000),
    "two-qubit-10000":    two(10000),
    "two-qubit-100000":   two(100000),
    "three-qubit-10":     three(10),
    "three-qubit-100":    three(100),
    "three-qubit-1000":   three(1000),
    "three-qubit-10000":  three(10000),
    "three-qubit-100000": three(100000),
    "grover-1":  grover(1,  0b0),
    "grover-2":  grover(2,  0b0),
    "grover-3":  grover(3,  0b0),
    "grover-4":  grover(4,  0b0),
    "grover-5":  grover(5,  0b0),
    "grover-6":  grover(6,  0b0),
    "grover-7":  grover(7,  0b0),
    "grover-8":  grover(8,  0b1),
    "grover-9":  grover(9,  0b0),
    "grover-10": grover(10, 0b0),
    "grover-11": grover(11, 0b0),
    "grover-12": grover(12, 0b0),
    "grover-13": grover(13, 0b0),
    "grover-14": grover(14, 0b0),
    "grover-15": grover(15, 0b0),
    "grover-16": grover(16, 0b0),
    "grover-17": grover(17, 0b0),
    "grover-18": grover(18, 0b0),
    "grover-19": grover(19, 0b0),
    "grover-20": grover(20, 0b0),
    "grover-21": grover(21, 0b0),
    "grover-22": grover(22, 0b0),
    "grover-23": grover(23, 0b0),
    "grover-24": grover(24, 0b0),
    "qft-1":  qft(1),
    "qft-2":  qft(2),
    "qft-3":  qft(3),
    "qft-4":  qft(4),
    "qft-5":  qft(5),
    "qft-6":  qft(6),
    "qft-7":  qft(7),
    "qft-8":  qft(8),
    "qft-9":  qft(9),
    "qft-10": qft(10),
    "qft-11": qft(11),
    "qft-12": qft(12),
    "qft-13": qft(13),
    "qft-14": qft(14),
    "qft-15": qft(15),
    "qft-16": qft(16),
    "qft-17": qft(17),
    "qft-18": qft(18),
    "qft-19": qft(19),
    "qft-20": qft(20),
    "qft-21": qft(21),
    "qft-22": qft(22),
    "qft-23": qft(23),
    "qft-24": qft(24),
    "qft-25": qft(25),
    "qft-26": qft(26),
    "qft-27": qft(27),
    "qft-28": qft(28),
    "qft-29": qft(29),
    "qft-30": qft(30),
}

benchmark_circuits(circuits, 10, 2, simulator=simulator)
