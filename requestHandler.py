import requests

url = "http://localhost:5000/query"
data = {
    "message": "Explain and derive Binary Search algorithm with an example in C++",
    "temperature": 0.7
}

response = requests.post(url, json=data)
print(response.json())
