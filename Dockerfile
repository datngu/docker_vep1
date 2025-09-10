FROM pytorch/pytorch:2.7.1-cuda12.6-cudnn9-devel

# Install additional python packages
RUN pip install --no-cache-dir \
    borzoi-pytorch==0.4.3 \
    biopython datasets numpy pandas jupyterlab tqdm \
    "accelerate>=0.26.0"

WORKDIR /workspace

CMD ["jupyter-lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
