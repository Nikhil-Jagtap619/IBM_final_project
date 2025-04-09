# Market Trend Analysis for IBM company

This project analyzes news articles related to IBM and the IT sector to understand sentiment trends and identify prominent topics.  The analysis involves text preprocessing, sentiment analysis using TextBlob, and topic modeling with Latent Dirichlet Allocation (LDA).

![sentiments over a week]{images_gifs_used/daily_sentiments_ibm.png}

## Data Sources

The project utilizes two CSV files:

*   **ibm_news.csv:** Contains news articles related to IBM.
*   **it_sector_news.csv:** Contains news articles related to the broader IT sector.
*   Scrapped all the data using google news api

## Methodology

1.  **Data Loading and Preprocessing:**
    *   Loads the news data from the CSV files into pandas DataFrames.
    *   Applies text preprocessing steps to the article titles and descriptions:
        *   Converts text to lowercase.
        *   Removes special characters and numbers.
        *   Tokenizes the text.
        *   Removes common English stop words.
    *   Combines the preprocessed title and description for each article into a new `title_des` column.

2.  **Sentiment Analysis:**
    *   Uses TextBlob to analyze the sentiment of the preprocessed titles and descriptions.
    *   Calculates the polarity score for each text segment (ranging from -1 to 1, where -1 represents negative sentiment and 1 represents positive sentiment).
    *   Calculates daily average sentiment for titles and descriptions for IBM and IT sector.

3.  **Topic Modeling (LDA):**
    *   Creates a document-term matrix from the combined title and description text using CountVectorizer.
    *   Applies LDA to discover underlying topics within the news articles.
    *   Identifies the top 15 words for each discovered topic, providing insights into the prevalent themes.


## Output

The project produces the following output files:

*   **daily_sentiment_ibm.csv:** Daily average sentiment scores for IBM news.
*   **preprocessed_ibm.csv:** Preprocessed IBM news data.
*   **top_words_ibm.csv:** Top words for each topic discovered in the IBM news data.
*   **daily_sentiment_of_it_sector.csv:** Daily average sentiment scores for IT sector news.
*   **preprocessed_it_sector.csv:** Preprocessed IT sector news data.

## Libraries Used

*   pandas
*   nltk
*   re
*   textblob
*   sklearn
*   newsapi


## Further Development
* Visualize sentiment trends and topic distributions over time.
* Perform comparative analysis between IBM news and the broader IT sector.
