for base in 'mf'; do
 for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
   if [ ! -d "test/${dataset}/none/" ]; then
     mkdir -p "test/${dataset}/none/"
   fi
   python -u run_MF.py --train --unlearn none --base ${base} --dataset ${dataset} >test/${dataset}/none/${base}_0.txt
 
 done
done

for base in 'lg'; do
 for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
   if [ ! -d "test/${dataset}/none/" ]; then
     mkdir -p "test/${dataset}/none/"
   fi
   python -u run_LG.py --train --unlearn none --base ${base} --dataset ${dataset} >test/${dataset}/none/${base}_0.txt
 done
done


# for base in 'mf'; do
#  for tst_mth in 'intr' 'user' 'item'; do
#    for ul_perc in 0.01; do
#      for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
# #        for unlearn in 'retrain' 'recul' 'receraser'; do
#        for unlearn in 'laser'; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_MF.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} > test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
#        done
#      done
#    done
#  done
# done

#for base in 'lg'; do
#  for tst_mth in 'intr' 'user' 'item'; do
#    for ul_perc in 0.01; do
#      for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
##        for unlearn in 'retrain' 'recul' 'receraser'; do
#        for unlearn in 'laser'; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_LG.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} >test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
#        done
#      done
#    done
#  done
#done

# for base in 'mf'; do
#   for tst_mth in 'intr' 'user' 'item'; do
#     for ul_perc in 0.01; do
#       for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#         for unlearn in 'ifru'; do
#           if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#             mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#           fi
#           python -u run_MF.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} > test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
#         done
#       done
#     done
#   done
# done

# for base in 'lg'; do
#   for tst_mth in 'intr' 'user' 'item'; do
#     for ul_perc in 0.01; do
#       for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#         for unlearn in 'ifru'; do
#           if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#             mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#           fi
#           python -u run_LG.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} >test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}.txt
#         done
#       done
#     done
#   done
# done

#for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#  for phr in 0.05 0.1 0.2 0.4 0.6 0.8 1.0; do
#    for tst_mth in 'user' 'item' 'intr'; do
#      for unlearn in 'recul_phantom'; do
#        for ul_perc in 0.01; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_MF.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base mf --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/mf_${ul_perc}_phr${phr}.txt
#        done
#      done
#    done
#  done
#done
#
#for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#  for phr in 0.05 0.1 0.2 0.4 0.6 0.8 1.0; do
#    for tst_mth in 'user' 'item' 'intr'; do
#      for unlearn in 'recul_phantom'; do
#        for ul_perc in 0.01; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_LG.py --train --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base lg --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/lg_${ul_perc}_phr${phr}.txt
#        done
#      done
#    done
#  done
#done


#for base in 'lg'; do
#  for tst_mth in 'intr' 'user' 'item'; do
#    for ul_perc in 0.01; do
#      for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#        for unlearn in 'recul' 'receraser' 'laser' 'recul_phantom'; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_LG.py --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} --phr 0.4 >test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}_simtest.txt
#        done
#      done
#    done
#  done
#done
#
#for base in 'mf'; do
#  for tst_mth in 'intr' 'user' 'item'; do
#    for ul_perc in 0.01; do
#      for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#        for unlearn in 'recul' 'receraser' 'laser' 'recul_phantom'; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_MF.py --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base ${base} --dataset ${dataset} --phr 0.4 > test/${dataset}/${unlearn}/${tst_mth}/${base}_${ul_perc}_simtest.txt
#        done
#      done
#    done
#  done
#done


#for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#  for phr in 0.05 0.1 0.2 0.6 0.8 1.0 0.4; do
#    for tst_mth in 'user' 'item' 'intr'; do
#      for unlearn in 'recul_phantom'; do
#        for ul_perc in 0.01; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_MF.py --train --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base mf --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/mf_${ul_perc}_phr${phr}.txt
#        done
#      done
#    done
#  done
#done
#
#for dataset in 'ml-1M' 'gowalla' 'yelp2018'; do
#  for phr in 0.05 0.1 0.2 0.6 0.8 1.0 0.4; do
#    for tst_mth in 'user' 'item' 'intr'; do
#      for unlearn in 'recul_phantom'; do
#        for ul_perc in 0.01; do
#          if [ ! -d "test/${dataset}/${unlearn}/${tst_mth}/" ]; then
#            mkdir -p "test/${dataset}/${unlearn}/${tst_mth}/"
#          fi
#          python -u run_LG.py --train --test_sim --tst_mth ${tst_mth} --ul_perc ${ul_perc} --unlearn ${unlearn} --base lg --dataset ${dataset} --phr ${phr} > test/${dataset}/${unlearn}/${tst_mth}/lg_${ul_perc}_phr${phr}.txt
#        done
#      done
#    done
#  done
#done
