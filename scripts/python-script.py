import os
import sys

print("🐍 Script Python executado!")
print(f"Variáveis de ambiente: {os.environ.get('GITHUB_WORKFLOW', 'Não definido')}")
print(f"Diretório atual: {os.getcwd()}")
