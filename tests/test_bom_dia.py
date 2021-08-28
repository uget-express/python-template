# TODO: substitua uget_example pelo nome em snake_case
# (E obviamente escreva seus próprios testes pras suas próprias funções)
from uget_exemplo import bom_dia


def test_mensagem() -> None:
    """Testa a função bom_dia.mensagem()"""
    assert bom_dia.mensagem("Irineu") == "Bom dia, Irineu"
