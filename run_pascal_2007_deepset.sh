#!/usr/bin/env bash
source myVE/bin/activate
export PATH=/usr/local/cuda-8.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH


save_images(){
    time_stamp=$(date +%Y_%m_%d_%H_%M_%S)$1
    mkdir $time_stamp

    #move the files to the folder as a record, with the time
    #todo: should extract some configuration from the script and name the folder with the difference configuration
    mv losses.png $time_stamp/
    mv train_precision_recall.png $time_stamp/
    mv val_precision_recall.png $time_stamp/
    mv log.out $time_stamp/

    #todo: 40.check the general process
    #todo: 2.use the tee to put the output into the logs
}

text="--lr 1e-4 --epochs 40 --pv VOC2007"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

#custom loss function with default weights
text="--lr 1e-4 --epochs 40 --pv VOC2007 --lf yes"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-4 --epochs 40 --pv VOC2007 --lf yes --lw 300"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-4 --epochs 40 --pv VOC2007 --lf yes --rw 300"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-4 --epochs 40 --pv VOC2007 --lf yes --lf 300 --rw 300"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para


#change to see the different learning rate
text="--lr 1e-3 --epochs 40 --pv VOC2007"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-3 --epochs 40 --pv VOC2007 --lf yes"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-3 --epochs 40 --pv VOC2007 --lf yes --lw 300"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-3 --epochs 40 --pv VOC2007 --lf yes --rw 300"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para

text="--lr 1e-3 --epochs 40 --pv VOC2007 --lf yes --lf 300 --rw 300"
python vgg16_pascal.py $text | tee log.out
para=$(echo $text | tr -d ' ')
save_images $para