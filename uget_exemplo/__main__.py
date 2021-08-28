# Aqui você pode importar os módulos que serão utilizados na sua main
# TODO: Mude uget_exemplo para o nome em snake_case
from uget_exemplo import bom_dia


# Defina a função principal do programa aqui
def main() -> int:
    print(bom_dia.mensagem("U-Get"))
    return 0

# Esse guard faz que a função main só execute caso
# o programa seja chamado como script (e não como biblioteca)
if __name__ == "__main__":
    # Chame a main dentro de exit(), p/ retornar o status de execução
    exit(main())
