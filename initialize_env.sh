#Za inicializacijo pri prvem pogonu (ce nekdo zloada nas repo)
#Manjka download conde
conda env create -f requirements.yml
conda activate bd_project
python -m ipykernel install --user --name bd_project --display-name "BD_Project"

