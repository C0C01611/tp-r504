def puiss(a,b):
    try:
        # Vérifier que a et b sont des entiers
        if not type(a) is int:
            raise TypeError("Only integers are allowed")
        if not type(b) is int:
            raise TypeError("Only integers are allowed")
        
        print("Votre nombre", a, "a la puissance", b, "vaut :", a**b)
    
    except ValueError:
        print("Les entrées doivent être des nombres entiers.")
    except TypeError as e:
        print(e)


