# Sample usage source create_jupyter_env.sh hru python3.7
ENV_NAME=$1
PYTHON_VERSION=$2

if [ -z "$ENV_NAME" ]
then
      printf "ENV_NAME is empty. Correct usage:\n\tsource create_jupyter_env.sh <YOUR_ENVIRONMENT_NAME> <PYTHON_VERSION>"
      return 2
fi

if [ -z "$PYTHON_VERSION" ]
then
      printf "PYTHON_VERSION is empty, Setting to default python3.7"
      PYTHON_VERSION="python3.7"
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        OS="linux"
elif [[ "$OSTYPE" == "darwin" ]]; then
        OS="mac"
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        OS="windows"
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        OS="windows"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        OS="linux"
# else  
        # Unknown.
fi

echo "Creating " $ENV_NAME
conda create -n $ENV_NAME python=$PYTHON_VERSION
if [[ "$OS" == "windows" ]]; then
        conda.bat activate $ENV_NAME
else
        conda activate $ENV_NAME
fi
pip install ipykernel
python -m ipykernel install --name $ENV_NAME
if [[ "$OS" == "windows" ]]; then
        conda.bat deactivate
else
        conda deactivate
fi
