import os
import re
from collections import defaultdict

def extract_metrics(file_path):
    """Extract NDCG metrics from a log file."""
    metrics = {}
    try:
        with open(file_path, 'r') as f:
            #print(f"Processing {file_path}")
            content = f.readlines()
            
            # Extract NDCG values using regex
            # total_time在倒数第6行
            # 20在倒数第五行
            # 50在倒数第四行
            # 100在倒数第三行
            # UL AUC在倒数第1行
   
            total_time_match = re.search(r'TOTAL TIME: (\d+\.\d+min)', content[-6])
            if not total_time_match:
                total_time_match = re.search(r'TOTAL RUNNING TIME: (\d+\.\d+min)', content[-6])
            if not total_time_match:
                print(f"No total time found in {file_path}")
            ndcg20_match = re.search(r'NDCG@20: (0\.\d+)', content[-5])
            ndcg50_match = re.search(r'NDCG@50: (0\.\d+)', content[-4])
            ndcg100_match = re.search(r'NDCG@100: (0\.\d+)', content[-3])
            UL_AUC_match = re.search(r'UL AUC: (0\.\d+)', content[-1])
            
            if ndcg20_match:
                metrics['ndcg20'] = float(ndcg20_match.group(1))
            if ndcg50_match:
                metrics['ndcg50'] = float(ndcg50_match.group(1))
            if ndcg100_match:
                metrics['ndcg100'] = float(ndcg100_match.group(1))
            if UL_AUC_match:
                metrics['UL_AUC'] = float(UL_AUC_match.group(1))
            if total_time_match:
                metrics['total_time'] = float(total_time_match.group(1).split('min')[0])
    except FileNotFoundError:
        pass
    
    return metrics

def get_all_results(base_dir='test'):
    """Compile results for all methods, baselines, and datasets."""
    results = defaultdict(lambda: defaultdict(dict))
    
    # Configurations
    # ML-1M Gowalla Yelp
    datasets = ['ml-1M', 'gowalla', 'yelp2018']
    methods = ['lg', 'mf']
    baselines = ['retrain', 'laser', 'receraser', 'recul', 'recul_phantom']
    
    for dataset in datasets:
        for method in methods:
            # Get original (before unlearning) results
            original_path = os.path.join(base_dir, dataset, 'none', f'{method}_0.txt')
            results[dataset][method]['original'] = extract_metrics(original_path)
            
            # Get results for each unlearning baseline
            for baseline in baselines:
                file_path = os.path.join(base_dir, dataset, baseline, 'intr', f'{method}_0.01.txt')
                if "recul_phantom" not in baseline:
                    results[dataset][method][baseline] = extract_metrics(file_path)
                else:
                    for phrase in ["0.1", "0.2", "0.4", "0.6", "0.8"]:
                        #print(f"Processing {baseline} for {dataset} {method} with phrase {phrase}")
                        file_path = os.path.join(base_dir, dataset, baseline, 'intr', f'{method}_0.01_phr{phrase}.txt')
                        results[dataset][method][baseline + "_phr" + phrase] = extract_metrics(file_path)
    return results

def print_results(results):
    """Print results in a formatted way."""
    for dataset in results:
        print(f"\n=== {dataset.upper()} Dataset ===")
        
        for method in results[dataset]:
            print(f"\n{method.upper()} Method:")
            
            # Print header
            print(f"{'Baseline':<15} {'NDCG@20':<10} {'NDCG@50':<10} {'NDCG@100':<10}")
            print("-" * 45)
            
            # Print metrics for each baseline
            baselines = list(results[dataset][method].keys())
            for baseline in baselines:
                metrics = results[dataset][method].get(baseline, {})
                if metrics:
                    print(f"{baseline:<15} "
                          f"{metrics.get('ndcg20', 'N/A'):<10.4f} "
                          f"{metrics.get('ndcg50', 'N/A'):<10.4f} "
                          f"{metrics.get('ndcg100', 'N/A'):<10.4f}")
                
            print("-" * 45)
            # print UL AUC
            print(f"{'UL AUC':<15} ")
            for baseline in baselines:
                metrics = results[dataset][method].get(baseline, {})
                if metrics:
                    print(f"{baseline:<15} "
                          f"{metrics.get('UL_AUC', 'N/A'):<10.4f}")
            print("-" * 45)
            print(f"{'total_time':<15} ")
            for baseline in baselines:
                if baseline != "none":
                    metrics = results[dataset][method].get(baseline, {})
                    if metrics:
                        time_value = metrics.get('total_time', 'N/A')
                        if isinstance(time_value, float):
                            print(f"{baseline:<15} {time_value:<10.4f}")
                        else:
                            print(f"{baseline:<15} {time_value}")

def main():
    results = get_all_results()
    print_results(results)

if __name__ == "__main__":
    main()
