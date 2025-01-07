from flask import Flask, render_template, request
import re

app = Flask(__name__)

# Validation de l'identifiant avec des regex
def validate_username(username):
    errors = []

    if len(username) < 6:
        errors.append("L'identifiant doit comporter au moins 6 caractères.")

    if not re.search(r'\d', username):
        errors.append("L'identifiant doit comporter au moins un chiffre.")

    if not re.search(r'[A-Z]', username):
        errors.append("L'identifiant doit comporter au moins une majuscule.")

    if not re.search(r'[a-z]', username):
        errors.append("L'identifiant doit comporter au moins une minuscule.")

    if not re.search(r'[#%{}@]', username):
        errors.append("L'identifiant doit comporter au moins un caractère parmi : #%{}@.")

    return errors

# Page principale pour le formulaire
@app.route('/newuser/', methods=['GET', 'POST'])
def newuser():
    message = None
    if request.method == 'POST':
        username = request.form.get('username')
        errors = validate_username(username)
        
        if not errors:
            message = f"Identifiant '{username}' valide."
        else:
            message = "Erreurs :<br>" + "<br>".join(errors)

    return render_template("newuser.html", message=message)

# Point d'entrée de l'application Flask
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
