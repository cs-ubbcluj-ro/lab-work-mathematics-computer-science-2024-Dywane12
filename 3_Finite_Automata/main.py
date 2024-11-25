class FiniteAutomaton:
    def __init__(self, filename):
        self.states = set()
        self.alphabet = set()
        self.transitions = {}
        self.final_states = set()
        self.load_fa(filename)

    def load_fa(self, filename):
        with open(filename, 'r') as file:
            lines = file.readlines()

        # Parse States
        self.states = set(lines[0].strip().split(":")[1].split(","))

        # Parse Alphabet
        self.alphabet = set(lines[1].strip().split(":")[1].split(","))

        # Parse Transitions
        self.transitions = {}
        transitions_section = lines[3:-1]
        for transition in transitions_section:
            parts = transition.strip().split("->")
            source, symbol = parts[0].split(",")
            destination = parts[1]
            if (source, symbol) not in self.transitions:
                self.transitions[(source, symbol)] = []
            self.transitions[(source, symbol)].append(destination)

        # Parse Final States
        self.final_states = set(lines[-1].strip().split(":")[1].split(","))

    def display(self):
        print("Set of States:", self.states)
        print("Alphabet:", self.alphabet)
        print("Transitions:")
        for (source, symbol), destinations in self.transitions.items():
            for dest in destinations:
                print(f"  {source}, {symbol} -> {dest}")
        print("Final States:", self.final_states)


if __name__ == "__main__":
    filename = "FA.in"
    fa = FiniteAutomaton(filename)
    fa.display()
