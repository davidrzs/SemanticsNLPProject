#!/usr/bin/zsh
#rm -r output_dir
rm -r ../Executions/local014

TOKENIZERS_PARALLELISM=true
PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:2048

python train.py \
    --do_train --task hans --data_dir data/glue_data/HANS --output_dir ../Executions/local014 \
    --model_name_or_path roberta-base --max_seq_length 256 \
    --num_train_epochs 20 --train_batch_size 8 --gradient_accumulation_steps 4 --eval_batch_size 16 \
    --learning_rate 2e-5 --warmup_ratio 0.06 --weight_decay 0.1 \
    --n_graph_layers 0 --n_graph_attn_composition_layers 0 \
    --graph_n_bases 80 --graph_dim 512 --post_combination_layernorm \
    --gpus 1 --numworkers 3 --static_embeddings 0 --fixed_encoder 0 \
#    --separate_losses_ratio 0.0
