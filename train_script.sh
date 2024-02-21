#!/bin/bash

CUDA_VISIBLE_DEVICES="0" python src/train_bash.py \
    --stage sft \
    --do_train True \
    --do_eval True \
    --model_name_or_path /models/chatglm3-6b-32k \
    --cache_dir  /models \
    --use_fast_tokenizer True \
    --flash_attn True \
    --disable_gradient_checkpointing True \
    --dataset ruigu \
    --dataset_dir data \
    --val_size 0.05 \
    --template chatglm3 \
    --sft_packing True \
    --cutoff_len 1024 \
    --finetuning_type lora \
    --lora_target query_key_value \
    --lora_rank 8 \
    --lora_dropout 0.1 \
    --output_dir saves/chatglm3-6b-32k/lora/train_2024-02-19-15-00_0.05_8_0.1_4_4_2e5_3_pack \
    --overwrite_cache True \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 5 \
    --save_steps 2 \
    --eval_steps 2 \
    --evaluation_strategy steps \
    --learning_rate 2e-5 \
    --num_train_epochs 3.0 \
    --load_best_model_at_end True \
    --plot_loss True \
    --fp16 True