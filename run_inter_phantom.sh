

# 5. 训练Recul + 不同Phantom User Ratio 
echo "5. 训练Recul + 不同Phantom User Ratio"
for dataset in 'gowalla' 'yelp2018'; do
 for phr in 0.1 0.2 0.4 0.6 0.8; do
   for tst_mth in 'intr'; do
     for unlearn in 'recul_phantom'; do
       for ul_perc in 0.01; do
         if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
           mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
         fi
         echo "Training mf on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth} and phr ${phr}"
         python -u run_MF.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base mf --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/mf_${ul_perc}_phr${phr}.txt
       done
     done
   done
 done
done

# 6. 训练Recul + 不同Phantom User Ratio 
echo "6. 训练Recul + 不同Phantom User Ratio"
for dataset in 'gowalla' 'yelp2018'; do
 for phr in 0.1 0.2 0.4 0.6 0.8; do
   for tst_mth in 'intr'; do
     for unlearn in 'recul_phantom'; do
       for ul_perc in 0.01; do
         if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
           mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
         fi
         echo "Training lg on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and phr ${phr} and tst_mth ${tst_mth}"
         python -u run_LG.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base lg --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/lg_${ul_perc}_phr${phr}.txt
       done
     done
   done
 done
done

# 有bug: OOM
# # 7. Similarity test all baselines + recul 
# echo "7. Similarity test all baselines + recul"
# for base in 'lg'; do
#  for tst_mth in 'intr'; do
#    for ul_perc in 0.01; do
#      for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#        for unlearn in 'recul' 'receraser' 'laser' 'recul_phantom'; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          echo "test_sim lg on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth} and phr ${phr}"
#          python -u run_LG.py --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} --phr 0.4 >test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}_simtest.txt
#        done
#      done
#    done
#  done
# done

# # 8. Similarity test all baselines + recul 
# echo "8. Similarity test all baselines + recul"
# for base in 'mf'; do
#  for tst_mth in 'intr'; do
#    for ul_perc in 0.01; do
#      for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#        for unlearn in 'recul' 'receraser' 'laser'; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          echo "test_sim mf on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth}"
#          python -u run_MF.py --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} --phr 0.4 > test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}_simtest.txt
#        done
#      done
#    done
#  done
# done


# # 9. Similarity test Recul + 不同Phantom User Ratio 
# echo "9. Similarity test Recul + 不同Phantom User Ratio"
# for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#  for phr in 0.05 0.1 0.2 0.4 0.6 0.8 1.0; do
#    for tst_mth in 'user' 'item' 'intr'; do
#      for unlearn in 'recul_phantom'; do
#        for ul_perc in 0.01; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          echo "test_sim mf on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth} and phr ${phr}"
#          python -u run_MF.py --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base mf --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/mf_${ul_perc}_phr${phr}_simtest.txt
#        done
#      done
#    done
#  done
# done

# # 10. Similarity test Recul + 不同Phantom User Ratio 
# echo "10. Similarity test Recul + 不同Phantom User Ratio"
# for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#  for phr in 0.05 0.1 0.2 0.4 0.6 0.8 1.0; do
#    for tst_mth in 'user' 'item' 'intr'; do
#      for unlearn in 'recul_phantom'; do
#        for ul_perc in 0.01; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          echo "test_sim lg on ${dataset} with ${unlearn} unlearning with ul_perc ${ul_perc} and tst_mth ${tst_mth} and phr ${phr}"
#          python -u run_LG.py --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base lg --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/lg_${ul_perc}_phr${phr}_simtest.txt
#        done
#      done
#    done
#  done
# done

echo "Done!"