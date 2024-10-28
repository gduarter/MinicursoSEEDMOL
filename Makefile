.DEFAULT_GOAL := about
PACKMOL_VERSION = 20.15.1
PARMED_VERSION = 1111

conf-conda:
	@echo "Instalando Conda"
	@bash scripts/install-conda.sh
	@echo "---------------------"
	@echo "Modificando bashrc..."
	@echo "---------------------"
	@if ! grep -q '# >>> conda initialize >>>' ~/.bashrc; then \
    	echo '# >>> conda initialize >>>' >> ~/.bashrc; \
    	echo '# !! Contents within this block are managed by "conda init" !!' >> ~/.bashrc; \
    	echo '__conda_setup="$$(~/miniconda3/bin/conda shell.bash hook 2> /dev/null)"' >> ~/.bashrc; \
    	echo 'if [ $$? -eq 0 ]; then' >> ~/.bashrc; \
    	echo '    eval "$$__conda_setup"' >> ~/.bashrc; \
    	echo 'else' >> ~/.bashrc; \
    	echo '    if [ -f "~/miniconda3/etc/profile.d/conda.sh" ]; then' >> ~/.bashrc; \
    	echo '        . "~/miniconda3/etc/profile.d/conda.sh"' >> ~/.bashrc; \
    	echo '    else' >> ~/.bashrc; \
    	echo '        export PATH="~/miniconda3/bin:$$PATH"' >> ~/.bashrc; \
    	echo '    fi' >> ~/.bashrc; \
    	echo 'fi' >> ~/.bashrc; \
    	echo 'unset __conda_setup' >> ~/.bashrc; \
    	echo '# <<< conda initialize <<<' >> ~/.bashrc; \
    fi
	@echo ""
	@echo ""
	@echo "Execute o seguite comando em seu terminal:"
	@echo "source ~/.bashrc"
	@echo ""
	@echo "Por fim execute o comando:" 
	@echo ""
	@echo "make install"
	@echo ""

conda_parameters:
	@echo "Configurando ambiente de desenvolvimento..."
	@echo "[1/4] instalando dependências do Python..."
	conda create -y --name alqpy310 python=3.10
	conda install --force-reinstall -y --name alqpy310 -c conda-forge ambertools
	conda install --force-reinstall -y --name alqpy310 -c openbiosim biosimspace
	conda install --force-reinstall -y --name alqpy310 -c openbiosim sire
	conda install --force-reinstall -y --name alqpy310 -c rdkit rdkit 
	conda install --force-reinstall -y --name alqpy310 -c omnia openmm
	if [ ! -d ~/local ]; then \
        mkdir ~/local; \
    fi
	@echo "[2/4] instalando packmol: ${PACKMOL_VERSION}..."
	bash scripts/install-packmol.sh ${PACKMOL_VERSION}
	@echo "[3/4] instalando ParmEd:"
	bash scripts/install-ParmEd.sh
	@echo "[4/4] instalando Dock06"
	bash scripts/install-Dock06.sh

clean:
	rm -r ~/local/packmol-${PACKMOL_VERSION}
	@echo ${PACKMOL_VERSION}
	rm -r ~/local/dock06.tar

about:
	@echo "> setup-dock_configure-unb"
	@echo ""
	@echo "make conf-conda         - Instala o ambiente de desenvolvimento."
	@echo "make conda_parameters   - Configura o ambiente de desenvolvimento."
	@echo "                    PACKMOL_VERSION=${PACKMOL_VERSION}."
	@echo "make clean        - Limpa o ambiente."
	@echo ""
	@echo "mail to: 170121186@aluno.unb.br"

.PHONY: conf-conda clean conda_parameters

