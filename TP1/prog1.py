# prog1.py

import fonctions as f

def main():
    try:
        # Saisie des deux nombres
        a = int(input("Entrez le premier nombre (base) : "))
        b = int(input("Entrez le second nombre (exposant) : "))
        
        # Appel de la fonction puissance
        res = f.puiss(a, b)
        
        # Affichage du résultat
        print(f"Le résultat de {a} élevé à la puissance {b} est : {res}")
    
    except TypeError as e:
        print(f"Erreur : {e}")
    except ValueError:
        print("Veuillez entrer des nombres entiers valides.")
    
if __name__ == "__main__":
    main()

