# Exemplo de dockerfile para esse projeto
# Bem útil para serviços
# Mas não nescessariamente você vai precisar

# Separamos em um container construtor e um executor
# Para que a imagem final seja bem pequena

# == Container construtor
FROM python:3.9-slim as builder

# Instalar poetry
RUN pip install -U pip && pip install poetry

# Copiamos as especificações do projeto
WORKDIR /code
COPY poetry.lock pyproject.toml /code/

# Instalamos dependencias ANTES de copiar o código
# Assim se o código mudar mas as dependencias não, não precisa baixar elas tudo de novo
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi

# Copiar código
# TODO: Mude uget_exemplo pro nome em snake_case
COPY uget_exemplo /code/uget_exemplo

# Construir pacote wheel
RUN poetry build --format wheel --no-interaction --no-ansi

# == Container executor
FROM python:3.9-slim

# Copiar pacote wheel que construimos
COPY --from=builder /code/dist/*.whl .

# Instalar wheel
RUN pip install *.whl

# Rodar o nosso programa
# TODO: Mude pro nome em kebab-case, coloque argumentos se nescessário
CMD ["uget-exemplo"]
