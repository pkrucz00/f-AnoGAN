#!/bin/bash

echo "Training WGAN"
python train_wgangp.py "../datasets/tumor/train" --run_name shower_run_500_epochs --channels 1 --n_epochs 500
echo "Training WGAN done"

echo "Training Encoder"
python train_encoder_izif.py "../datasets/tumor/train" --run_name shower_run_500_epochs --channels 1 --n_epochs 500
echo "Training encoder done"

echo "Testing"
python test_anomaly_detection.py "../datasets/tumor/test" --run_name shower_run_500_epochs --channels 1
echo "Testing done"

echo "Saving compared images"
python save_compared_images.py "../datasets/tumor/test" --channels 1 
echo "Saving done"
