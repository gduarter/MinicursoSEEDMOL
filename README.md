# Setup de Configuração do Minicurso UnB

## Pre-requisitos

- Conda
- Python >= 3.9
- Make

## Setup Inicial

``` bash
sudo apt update
sudo apt install -y make
```

## Uso

Siga as instruções que surgirem na tela entre os comandos.

``` bash
make conf_conda
make conda_parameters
make conda_parmed
```

Ou, no caso de problemas na instalação de algum pacote:
``` bash
make conf_conda
make conda_parameters
make conda_correct
make conda_parmed
```
