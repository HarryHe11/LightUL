# 1. 训练模型 MF
# echo "1. 训练模型 MF"
# for base in 'mf'; do
#  for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#    if [ ! -d "test/${dataset}/none/" ]; then
#      mkdir -p "test/${dataset}/none/"
#    fi
#    echo "Training ${base} on ${dataset} with no unlearning"
#    python -u run_MF.py --train --unlearn none --base ${base} --dataset ${dataset} >test/${dataset}/none/${base}_0.txt
#  done
# done

# # 2. 训练模型 LG
# echo "2. 训练模型 LG"
# for base in 'lg'; do
#  for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#    if [ ! -d "test/${dataset}/none/" ]; then
#      mkdir -p "test/${dataset}/none/"
#    fi
#    echo "Training ${base} on ${dataset} with no unlearning"
#    python -u run_LG.py --train --unlearn none --base ${base} --dataset ${dataset} >test/${dataset}/none/${base}_0.txt
#  done
# done


# 3. 训练模型 Unlearning MF with different UL baselines + Recul
echo "3. 训练模型 Unlearning MF with different UL baselines + Recul"
for base in 'mf'; do
 for tst_mth in 'intr'; do
   for ul_perc in 0.01; do
     for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
       for unlearn in 'retrain' 'laser' 'receraser' 'recul'; do
         if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
           mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
         fi
         echo "Training ${base} on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth}"
         python -u run_MF.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} > test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
       done
     done
   done
 done
done

# 4. 训练模型 Unlearning LG with different UL baselines + Recul
echo "4. 训练模型 Unlearning LG with different UL baselines + Recul"
for base in 'lg'; do
 for tst_mth in 'intr'; do
   for ul_perc in 0.01; do
     for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
       for unlearn in 'retrain' 'laser' 'receraser' 'recul'; do
         if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
           mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
         fi
         echo "Training ${base} on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth}"
         python -u run_LG.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} >test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
       done
     done
   done
 done
done
