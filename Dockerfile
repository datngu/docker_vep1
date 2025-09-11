FROM pytorch/pytorch:2.7.1-cuda12.6-cudnn9-devel

# Install additional python packages
RUN pip install --no-cache-dir \
    borzoi-pytorch==0.4.3 \
    biopython datasets numpy pandas jupyterlab tqdm \
    "accelerate>=0.26.0"

# Pre-download & test Borzoi models
RUN python - <<'EOF'
from borzoi_pytorch import Borzoi

for i in range(4):
    model_id = f"johahi/borzoi-replicate-{i}"
    print(f"\n>>> Downloading and testing {model_id}")
    model = Borzoi.from_pretrained(model_id)
    _ = model.model  # touch the underlying model to ensure it is loaded
    print(f"✔ Successfully loaded {model_id}")
EOF

WORKDIR /workspace

CMD ["jupyter-lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
