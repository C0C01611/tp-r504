# fonctions.py

def puiss(a, b):
    # Vérifie que a et b sont des entiers
    if not isinstance(a, int) or not isinstance(b, int):
        raise TypeError("Only integers are allowed")
    return a ** b

