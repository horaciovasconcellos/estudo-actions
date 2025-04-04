#!/bin/bash
echo "📜 Script Bash executado!"
echo "Variável CUSTOM_VAR: $CUSTOM_VAR"
echo "Argumentos recebidos: $@"
echo "Diretório atual: $(pwd)"
echo "Git SHA: ${GITHUB_SHA:-Não definido}"
