import matplotlib.pyplot as plt
# file_path = 'MQ2008/Fold1/train.txt'
file_path = 'MSLR_WEB10K/Fold1/train.txt'
# open the text file for reading
with open(file_path, 'r') as f:
    # read each line in the file
    lines = f.readlines()

# create a dictionary to count the frequency of the first element in each line
counts = {}

# iterate over each line in the file
for line in lines:
    # split the line into a list of strings
    lst = line.strip().split()
    # get the first element of the list
    first_elem = lst[1]
    # update the count for the first element in the counts dictionary
    counts[first_elem] = counts.get(first_elem, 0) + 1

# create a list of the counts for each first element
print(counts)
counts_list = list(counts.values())

# plot a histogram of the counts
plt.hist(counts_list, bins=range(min(counts_list), max(counts_list) + 2, 1))
plt.xlabel('Length of Slates')
plt.ylabel('Frequency of Length')
plt.title('Distribution of Length of slates')
plt.show()
