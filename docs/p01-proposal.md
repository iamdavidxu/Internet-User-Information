For what to do, see the [`../instructions/`](../instructions/) directory, specifically: 

* [Design Brief](../instructions/project-design-brief.pdf)
* [Project Proposal Requirements](../instructions/p01-proposal-requirements.md)

# Internet Services and Income Disparities

**We need to come up with a code name**
## By Neha Venkatesh (nehav22@uw.edu), Aidan Bartlett (---), and David Xu (---)
### INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
### Autumn 2022
------------------------------------

## Abstract
Our main question is "How do speed disparities in internet service offers relate to socioeconomic disparities?" We are interested in answering this question to explore the effects of practices like redlining on our Internet service. To address this question, we will investigate the connections between internet speeds and service prices, and various neighborhoods with different race, income, and population distributions. 

## Keywords
Internet, Redlining, Income distributions, Regression, Exploratory data analysis

## Introduction

## Problem Domain

## Research Questions
1. (Neha) Which neighborhoods in Seattle are offered the worst Internet deals?

## The Dataset
Data file name | Purpose | # of Observations | # of Variables | Citation
---------------|---------|-------------------|----------------|----------
speed_price_att| AT&T Data Part 1 | 432,304 | 26 | Sankin, A., & Yin, L. (2022a). speed_price_att [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att.csv.gz
speed_price_att_other_cities| AT&T Data Part 2 | 33,593 | 24 | Sankin, A., & Yin, L. (2022b). speed_price_att_other_cities [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att_other_cities.csv.gz
speed_price_centurylink | Centurylink Data | 186,612 | 30 | Sankin, A., & Yin, L. (2022c). speed_price_centurylink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_centurylink.csv.gz
speed_price_earthlink | Earthlink Data | 565,753 | 27 | Sankin, A., & Yin, L. (2022d). speed_price_earthlink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_earthlink.csv.gz
speed_price_verizon | Verizon Data | 282,623 | 31 | Sankin, A., & Yin, L. (2022e). speed_price_verizon [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_verizon.csv.gz

Data science journalists Aaron Sankin and Leon Yin at *The Markup*, a nonprofit organization that investigates the ethics and impact of technology on society through data-driven journalism, investigated 800,000 internet service offers in major US cities between April 15, 2022 and October 1, 2022 to understand why disparities in internet service were occurring despite customers paying the same prices. 

As a nonprofit, *The Markup* conducts its investigations through funds collected from readers as well as various donors. They have a list of organizations which support their work, which can be viewed [here on their website](https://themarkup.org/donors). *The Markup* describes their mission as investigating how technology influences our society, utilizing data science and computational methods to unveil secrecy around big tech, and rebuild trust in journalism. The money they collect goes toward building this nonprofit newsroom to “serve the public”, through openly publishing their methods and encouraging people of all backgrounds to engage with their findings. 

Whereas previous studies around internet access relied on data from the Federal Communications Commission, Sankin and Yin looked to an information source called the “broadband availability tools” (located in service provider’s own websites) to collect their data. They discovered that companies were exaggerating where they offered service to the FCC, therefore making data collected by the FCC unreliable. Sankin and Yin then used two open-source datasets to gather over 12 million addresses, organized them based on Census block groups, and used a stratified sampling method to collect a representative sample of the speed and price of offers for each city and internet service provider. They then grouped offers into four speed categories for both download and upload — “Slow”, “Moderate”, “Fast”, and “Blazing”. For income distributions, the team collected the median incomes for block groups, and classified them as “lower”, “middle-lower”, “middle-upper”, or “upper”. For race and ethnicity distributions, they categorized addresses as “least White”, “less White”, “more White”, and “most White”. For redlined areas, Sankin and Yin used the University of Richmond’s [Mapping Inequality Project](https://dsl.richmond.edu/panorama/redlining/#loc=5/39.1/-94.58&text=intro) to categorize historically redlined neighborhoods. 

To avoid nonrepresentative results, the team took the COVID-19 pandemic into consideration when collecting data for income distributions. Though the *American Community Survey* had data from 2020 available, they chose to use the data from 2019 instead to produce more accurate results. Sankin and Yin also addressed any limitations their data may have regarding their information sources and data collection methods.  
We found this dataset through *Kaggle*, a community repository with numerous datasets organized into various categories. Though this dataset has been reshared on *Kaggle*, it was originally hosted by The Markup on *Github*, which we credit as the source of our data.


## Expected Limitations

## Limitations

## References

Sankin, A., & Yin, L. (2022a). speed_price_att [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att.csv.gz

Sankin, A., & Yin, L. (2022b). speed_price_att_other_cities [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att_other_cities.csv.gz

Sankin, A., & Yin, L. (2022c). speed_price_centurylink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_centurylink.csv.gz

Sankin, A., & Yin, L. (2022d). speed_price_earthlink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_earthlink.csv.gz

Sankin, A., & Yin, L. (2022e). speed_price_verizon [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_verizon.csv.gz


