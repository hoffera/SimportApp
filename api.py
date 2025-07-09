from flask import Flask, request

app = Flask(__name__)

@app.route('/salvar', methods=['POST'])
def salvar():
    dados = request.json
    texto = dados.get('texto', '')

    with open('copiado.txt', 'a') as f:
        f.write(texto + '\n')

    return {'status': 'salvo com sucesso'}

if __name__ == '__main__':
    app.run(port=5000)
