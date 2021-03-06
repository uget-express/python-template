# Uget Exemplo

## Mantenedor
TODO: Coloque seu nome

## Sobre

TODO: Insira aqui o que esse projeto ou repositório tem, e pra que serve

## Como utilizar

TODO: Explique como acessar e utilizar uma versão estável desse projeto

## Como contribuir

TODO: Explique como criar um ambiente dev para editar esse projeto





# Informações sobre esse template (Pode remover essa seção)

## Como usar esse template

Esse template é um projeto em python simples e bem estruturado. Com gestor de projeto (poetry), linting, testes, e CI/CD prontinhos para usar.

Essa seção fala sobre como esse repo está estruturado, sinta-se livre para apagar ela inteira quando for começar.

**Lembre-se de editar os lugares onde tem `uget-exemplo` e `uget_exemplo` para os equivalentes do seu projeto**. Todos os lugares que você _precisa_ editar algo logo no início estão marcados com um comentário `TODO`. Basta pesquisar nos arquivos.

## Estrutura
O projeto normalmente tem um nome em `kebab-case` (por exemplo, `uget-projeto-incrivel`).

### Módulo principal

O módulo principal deve ir numa pasta de mesmo nome, mas em `snake_case` (por exemplo, `uget_projeto_incrivel`). Dentro desse módulo, você pode fazer quantos módulos (arquivos `.py` ou outras pastas) quiser.

Como exemplo, temos o módulo `bom_dia.py`

O `__init__.py` só existe pra demarcar que é um módulo.

#### Main
Dentro do módulo, o arquivo `__main__.py` determina o entrypoint do programa (quando executado).

Importe os outros módulos nescessários, usando `from uget_projeto_incrivel import modulo`.

Escreva sua função `main`, e chame com o guard  `if __name__ == "__main__"`. Isso garante que a main não será executada caso você importe esse módulo como biblioteca.

Tudo isso já está exemplificado lá, só olhar.

### Testes

Escreva testes dentro de uma pasta `tests` (também já tem um exemplo).

### Metadados

Informações sobre o pacote e mantenedores vão em `pyproject.toml`, lembre-se de preencher a info.

O poetry cria uma `poetry.lock`, que contém as dependências de uma forma reproduzível. Explico mais sobre lá em baixo.

Para adicionar suporte ao Nix, também temos uma `flake.nix`, e sua respectiva `flake.lock`.

### Docker

Caso seja um serviço, talvez você queira uma imagem pro docker. Incluí uma Dockerfile simples e eficiente para rodar o programa.

## Como construir e rodar

### Poetry
Utilizamos o [poetry](https://python-poetry.org/) como gestor de projeto e dependências.

Você pode entrar num ambiente de desenvolvimento contendo as dependências release e dev utilizando `poetry shell`. Neste ambiente, basta usar `python -m uget_exemplo` para rodar o programa.

Alternativamente, ao invés de entrar na shell, você pode usar `poetry run uget-exemplo` para rodar o programa diretamente.

Você pode empacotar o programa em tgz ou wheel utilizando `poetry build`

### Nix
Caso você tenha o [Nix](https://nixos.org/) instalado (pode ser utilizado em MacOS ou qualquer Linux, ou dentro do próprio NixOS), você pode optar por usá-lo no lugar do poetry.

Você precisa ter o [suporte a Flakes habilitado](https://nixos.wiki/wiki/Flakes#Installing_flakes).

Você pode entrar num ambiente de desenvolvimento igual ao do `poetry shell` utilizando `nix develop`. Neste ambiente, basta usar `python -m uget_exemplo` para rodar o programa.

Alternativamente, ao invés de entrar na shell, você pode usar `nix run` para rodar o programa diretamente. Você também pode usar `nix shell` para entrar num ambiente de release onde o comando `uget-exemplo` está disponível.

## Desenvolvimento

### Dependências e lock
O arquivo `pyproject.toml` especifica o projeto, inclusive suas dependências e dependências devs (essas últimas não vão pra release). As dependências funcionam com [semantic versioning](https://semver.org/).

Você pode:
- requerer a versão exata com `X.Y.Z` (não recomendável)
- uma versão aproximadamente igual (inclui futuros bug fixes) com `~X.Y.Z` ou `X.Y` (recomendado para dependências que você não tem certeza se seguem semantic versioning corretamente)
- qualquer versão compátivel (inclui novas features que não quebrem compatibilidade) com `^X.Y.Z` ou `X` (recomendável para dependências com releases confiáveis)

Você *não* precisa pinar a versão exata para ter estabilidade, pois o `poetry.lock` se encarrega disso.

Recomendo que você use `~` ou `^` para ter versões sempre compatíveis (nenhum desses pode atualizar para breaking changes, na teoria), que quando você utilizar `poetry lock`, o poetry pegará versões compatíveis com seus requisitos (lembre-se de testar se nada quebrou depois de fazer isso, pois nem todos os pacotes respeitam semantic versioning como deveriam). Isso evita que você fique em versões antigas com bugs já resolvidos.

### Lint

Para lintar e formatar o código, basta usar `poetry run flake8`, ou apenas `flake8` caso você esteja dentro da shell (`poetry shell` ou `nix develop`).

Qualquer editor com suporte a [LSP](https://langserver.org/) deve automaticamente detectar o `flake8` quando você estiver dentro da shell.
