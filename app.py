from flask import Flask, request, jsonify
from langchain_ollama import ChatOllama

app = Flask(__name__)

@app.route('/query', methods=['POST'])
def query():
    data = request.json
    temperature = data.get('temperature', 0)
    message = data.get('message', '')

    llm = ChatOllama(model="deepseek-r1:7b", temperature=temperature)
    response = llm.invoke(message)

    return jsonify({"response": response.content})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
