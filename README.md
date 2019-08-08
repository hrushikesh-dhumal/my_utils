# my_utils
Simple utility functions


## Manage anaconda environments
```bash
conda create -n my_env python=3.7
# Activate environement
conda activate my_env
# if using windows: conda.bat activate my_env
# Add environment to ipython kernel
pip install ipykernel
python -m ipykernel install --name my_env
# Deactivate the environment
conda deactivate
# if using windows: conda.bat deactivate
# Delete environment
conda remove --name my_env --all
jupyter kernelspec uninstall my_env
```