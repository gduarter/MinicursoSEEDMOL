.DEFAULT_GOAL := about
PACKMOL_VERSION = 20.15.1
PARMED_VERSION = 1111

install:
	@echo "Configurando ambiente de desenvolvimento..."
	@echo "[1/4] instalando Conda..."
	@echo "Instalando Conda"
	@bash scripts/install-conda.sh
	@echo "[2/4] instalando dependências do Python..."
	conda create -y --name alqpy310 python=3.10
	conda install --force-reinstall -y --name alqpy310 -c conda-forge ambertools
	conda install --force-reinstall -y --name alqpy310 -c openbiosim
	conda install --force-reinstall -y --name alqpy310 -c sire
	conda install --force-reinstall -y --name alqpy310 -c rdkit rdkit 
	@echo "[3/4] instalando packmol: ${PACKMOL_VERSION}..."
	# bash scripts/install-packmol.sh ${PACKMOL_VERSION}
	@echo "[4/4] instalando ParmEd: ${PARMED_VERSION}..."
	# bash scripts/install-ParmEd.sh

clean:
	#rm -r ~/local/packmol-${PACKMOL_VERSION}
	@echo ${PACKMOL_VERSION}

about:
	@echo "> setup-xxx-unb"
	@echo ""
	@echo "make install      - Configura o ambiente de desenvolvimento."
	@echo "                    PACKMOL_VERSION=versao-especifica."
	@echo "make clean        - Limpa o ambiente."
	@echo ""
	@echo "mailto: isaac...@gmail.com"

all: install

.PHONY: clean install all

