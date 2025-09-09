# docker_pytorch

## 

singularity build ndatth-pytorch-v0.0.0.img docker://ndatth/pytorch:v0.0.0


singularity shell --nv ndatth-pytorch-v0.0.0.img

python -c "import torch; print(torch.cuda.is_available())"