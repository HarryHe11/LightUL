batch_size=512
# 4. 训练模型 Unlearning LG with different UL baselines + Recul
echo "4. 训练模型 Unlearning LG with different UL baselines + Recul"
for base in 'lg'; do
 for tst_mth in 'intr'; do
   for ul_perc in 0.01; do
     for dataset in 'gowalla' 'yelp2018'; do
       for unlearn in 'ifru'; do
         if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
           mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
         fi
         echo "Training ${base} on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth}"
         python -u run_LG.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --bs ${batch_size} --base ${base} --dataset ${dataset} >test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
       done
     done
   done
 done
done


echo "Done!"
