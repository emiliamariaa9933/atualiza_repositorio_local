#!/bin/bash

# Define a pasta raiz que contém os projetos (passe como primeiro argumento)
pasta_raiz="C:/"

# Procura por todas as pastas com nome .git dentro dos subdiretórios da pasta raiz
while IFS= read -r -d '' gitdir; do
    # Remove o ".git" do final do caminho para obter o diretório do projeto
    dir="${gitdir%/.git}"

    # Acessa o diretório do projeto e atualiza a branch master
    cd "$dir"
    echo "Atualizando o projeto $dir"
    git checkout develop
    git pull
    git checkout master
    git pull
done < <(find "$pasta_raiz" -name ".git" -type d -print0)