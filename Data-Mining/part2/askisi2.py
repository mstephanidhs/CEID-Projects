# %% [markdown]
# <b> Clean and Pre-Process Data </b>

# %%
import pandas as pd
import gensim

reviews = pd.read_csv("amazon.csv")

# Clean data using the built in cleaner in gensim 
# remove all punctuation and stop words and tokenize the given sentence
reviews['Text'] = reviews['Text'].apply(lambda x: gensim.utils.simple_preprocess(x))

# %% [markdown]
# <b> Create Categories based on Scores </b>

# %%
reviews.Score = reviews.Score.astype(int) #convert Score to Integer

#function to create labels
def create_label(row):

    if row['Score'] < 3:
        return 'Negative'

    elif row['Score'] > 3:
        return 'Positive'

    else:
        return 'Neutral'

#create the labels
reviews['Score'] = reviews.apply(create_label, axis=1)

#show label distribution
reviews['Score'].value_counts()

# %% [markdown]
# <b> Train and Test Sets </b>

# %%
from sklearn.model_selection import train_test_split

y = reviews['Score']
x = reviews['Text']

train_reviews, test_reviews, train_scores, test_scores = train_test_split(x, y, test_size=0.2)

# %% [markdown]
# <b> Word Embeddings </b>

# %%
from gensim.models import Word2Vec, word2vec
import os

# Set values for various word2vec parameters                    
min_word_count = 40   # Minimum word count                        
num_workers = 3       # Number of threads to run in parallel
downsampling = 1e-3   # Downsample setting for frequent words
num_features = 300    # Word vector dimensionality 
context = 10          # Context window size
    
model_name = 'train_model'

if not os.path.exists(model_name): 

    model = gensim.models.Word2Vec(train_reviews, workers = num_workers, vector_size = num_features, 
            min_count = min_word_count, window = context, sample = downsampling)

    model.save(model_name)

else:
    model = gensim.models.Word2Vec.load(model_name)

# %% [markdown]
# <b> Vectors and Average </b>

# %%
import numpy as np

index2key_set = set(model.wv.index_to_key) 

train_reviews_vec = np.array([np.array([model.wv[word] for word in review if word in index2key_set]) for review in train_reviews])

test_reviews_vec = np.array([np.array([model.wv[word] for word in review if word in index2key_set]) for review in test_reviews])

# %%
# Each sentance have different number of array vectors 
# which may cause an error while we training the model

for i, v in enumerate(train_reviews_vec):
    print(len(train_reviews.iloc[i]), len(v))

# %%
# average the first element across the word vectors
# and store that as the first entry in our final vector

# Compute sentence vectors by averaging the word vectors 
# for the words contained in the sentence

train_reviews_vec_avg = []

for v in train_reviews_vec:
    if v.size:
        train_reviews_vec_avg.append(v.mean(axis=0))
    else:
        train_reviews_vec_avg.append(np.zeros(num_features, dtype=float)) # create an array of zero's
        
test_reviews_vec_avg = []

for v in test_reviews_vec:
    if v.size:
        test_reviews_vec_avg.append(v.mean(axis=0))
    else:
        test_reviews_vec_avg.append(np.zeros(num_features, dtype=float))

# %%
# all the sentence vector lengths are consistent
for i, v in enumerate(train_reviews_vec_avg):
    print(len(train_reviews.iloc[i]), len(v))

# %% [markdown]
# <b> Random Forest </b>

# %%
from sklearn.ensemble import RandomForestClassifier

# Fit a random forest to the training data, using 100 trees
forest = RandomForestClassifier(n_estimators = 100)

forest_model = forest.fit(train_reviews_vec_avg, train_scores.values.ravel())

# %%
# Use the trained model to make predictions on the test data
y_pred = forest_model.predict(test_reviews_vec_avg)

# %%
from sklearn.metrics import classification_report, precision_score, recall_score, f1_score

print(classification_report(test_scores, y_pred))

recall = recall_score(test_scores, y_pred, average='micro')
precision = precision_score(test_scores, y_pred, average='micro')
f1 = f1_score(test_scores, y_pred, average='micro')

print('Recall: ', recall)
print('\nPrecision: ', precision)
print('\nF1-Score: ', f1)



