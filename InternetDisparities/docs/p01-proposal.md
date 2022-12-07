# Internet Services and Income Disparities

**Code name: Internet-Redlining**
## By Neha Venkatesh (nehav22@uw.edu), Aidan Bartlett (aidanb04@uw.edu), and David Xu (bingsen@uw.edu)
### INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
### Autumn 2022
------------------------------------

## Abstract
Our main question is "How do speed disparities in internet service offers relate to socioeconomic disparities?" We are interested in answering this question to explore the effects of practices like redlining on our Internet service. To address this question, we will investigate the connections between internet speeds and service prices, and various neighborhoods with different race, income, and population distributions. 

## Keywords
Internet, Redlining, Income distributions, Regression, Exploratory data analysis

## Introduction
For this project we plan on exploring the relationship between internet service speed and prices in different areas across the United States, and how different internet service providers redline certain areas to essentially price-gouge lower income areas. During the Covid-19 pandemic, people were forced to remain online for a much more extensive amount of time than ever before, and this lead to internet service providers increasing prices to maximize profits. Lower-income areas often have high prices for low internet speeds, something that is completely unnecessary and only goes to further the socioeconomic differences in major cities and the United States as a whole.  The data we are using for this project is hosted  on [kaggle](https://www.kaggle.com/datasets) and has five data files with information on four different internet service companies. We will compare the companies to determine which are being the most equitable, and which should be held accountable for the situations they are creating.

## Problem Domain
Background: 
    The appearance of Covid-19 led to a great number of issues in society, both economically, patricianly, and socially. Accordingly to the article “New data shows long Covid is keeping as many as 4 million people out of work” by Katie Bach in 2022 from Pew Brookings, the virus significantly shrinks the economy and causes people to rely on technology and the Internet.1 This increase in demand accordingly increases the providence of internet services. In the dataset “Internet Service Offers” created by Leon Yin and Aaron Sankin, we can see the address and internet speed of over a million houses serviced in the US, and this is only a portion of the overall services provided during the pandemic.4 This great amount of demand and increase in internet service, however, brought out the existing economic and social inequality. It appears that the majority of the population receiving good internet services are white and high-income groups. In the contrast, the lower-income group and non-white population tend to receive slower or no internet access. As the economy deteriorates during the pandemic, the employment rate decreased greatly and the demand for working remotely increased. This stimulates people to choose better service plans with faster speed and conditions. However, lower-income groups usually don’t have the access to ‘blazing’ internet speed due to financial issues. It appears that the location and different regions people live in also influence the service they get. As major cities have faster internet, rural areas or not developed regions use slower options. The authors utilized multiple variables to sort and distribute the data they collected. Mainly focusing on races and ethnicities, speeds, redline areas, and income. Through using these categories, the readers are able to understand the inequality distribution more directly and clearly. 

Direct and indirect stakeholders:
    The users of the internet services are mostly students or working classmen. Therefore the direct stakeholders for this information will be people who need internet access and use technology devices regularly. The assumption is that they have basic skills in computing and using electronic devices. They are likely to use the internet for working, learning as well as communication. While there could be many values stakeholders hold, the major ones are likely to be benefiting others, creating better solutions, and so on. The indirect stakeholders can be the government and business owners. The federal sometimes proposes policies that assist people in need with the internet. One of the programs created in 2021 is the Affordable Connectivity Program.2 According to the official website of the Federal Communication Commission and the article “Yes, FCC Affordable Connectivity Program’s $30 discount is real” by Emery Winter in August 2021, the government provides discounts on internet services to assist the lower-income population. Business owners' profits could be influenced by the accessibility of the internet. 

Human Values:
    The social inequality presented through the data is not only an economical issue but an ethical problem. It has been shown that racism is also a factor that creates the social and economic gap and tension between different communities. 3Accordingly to the article “U.S. labor market inches back from the COVID-19 shock, but recovery is far from complete” by Rakesh Kochhar and Jesse Bennett from Pew Research Center,  there is discrimination towards different gender as well as identity. It is crucial for us to address these problems and prevent them from deteriorating relationships between different groups. 

Potential benefits and Harms:
    The benefits of using this dataset are to analyze the service in different areas to create better solutions and records of the social status. These data could be very beneficial for providing useful information. It could be used to create solutions and improve people’s standards, in addition to accessibility to the internet. The potential harm this dataset might cause could be increasing the tension between the high and low-income groups. The publication of this information could lead to dissatisfaction or discrimination which will both create damage to society. (Sustain ‘Friendship’ in the envisioning card)

Influence on other fields:
    This dataset can be used in political studies, social studies, and many other fields. When preparing for elections or political events, this data could be a good reference for creating promotion strategies to gather votes. It could also be used by the government to determine which area to develop in the future.

## Research Questions
1. Which neighborhoods in Seattle are offered the worst Internet deals? Considering what this dataset revealed about the disparities in internet services based on redlining, and considering the history of redlining and socioeconomic disparities in Seattle, it would be interesting to investigate how internet service discrimination occurs in our city.

2. How does the disparity in internet speed reflect the economy and social inequality between white and minorities? 
The large increase in demand for the internet deteriorates the economic gap between different social classes and communities. Unemployment significantly increases due to the pandemic which keeps high-income groups and reduces the number of low-income employees. As high-income classes receive more access to faster internet, poorer communities tend to receive slower internet. It is also shown that white people usually enroll in higher-income jobs while the non-white population receives lower wages. These ideas have also been reflected in the data collected.

3. To what extent do internet speed disparities in different regions increase the social gap and economic inequality? 
As the pandemic hits, the demand for more efficient internet access and usage increases. However as the economy deteriorates, the accessibility to the internet becomes undetermined. Since people weren’t able to afford bills, rural areas or regions with poor conditions couldn’t receive internet access. Thus creating an imbalance between different areas. This gap continues to increase as wealthier become richer and the poor remains poor. This information has also been presented in the dataset, the researchers use redlines to separate regions with different economic conditions. 

4. How does the price of internet vary across America as a whole: are rural areas more expensive than cities or do redlined areas in cities cause the average price per city to stay higher? This information will reveal just how impactful redlining is to the average cost of living in a city and specifically internet prices. It will also help with seeing if internet service companies do their own sort of redlining where they know they can drive up prices and people will sill pay them; for example if they know they can inflate prices in rural areas since there are no other options. It will be interesting to see if the areas with less internet company competition have higher prices than places where there are more options for internet.

## The Dataset

Our dataset summarizes the disparities in internet service speeds and prices in different neighborhoods based on racial and economic makeup as well as redlining status. The connections presented in these datasets inform us on how big-name internet service providers disproportionately offer slower internet services to lower-income, BIPOC communities for the same price as faster services in higher-income communities with more white populations. 

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


## Expected Implications
By answering our proposed research questions, we will have a much better understanding of to what extent internet service providers are manipulating prices unnecessarily in places where they know they can get away with it, which increases the socioeconomic seperation between class groups, which reinforces stereotypes and thoughts about certain areas in the United States such as redlining. We will be able to know whether or not internet service providers should be held partially responsible for maintaining the notion that redlined areas are somehow "worse" than other areas close by. Policy makers could use this data to potentially hold internet service providers accountable for price-gouging people in lower income areas. Urban designers could use this information to design areas similar to internet cafes in places where the internet is cheaper, where people who live in the redlined expensive areas can go to and use the internet at a more affordable rate. A technological possibility would be to create a service which would act as a VPN so people in redlined areas could simply purchase their internet at a cheaper rate, as if they lived across town in a non-redlined area.


## Limitations
One limitation that will need to be addressed in some way is the fact that there are a large number of NULL values in the redlining_grade column of each csv file. The NULL percentages of the redlining_grade for each file are as follows: _att_ has a 57%, _att_other_cities_ has a 44%, _centurylink_ has a 70%, _earthlink_ has a 60%, and _verizon_ has a 25%. Since this column of data is important for the conclusions that we are trying to make, much of the data will need to be excluded by na.rm = TRUE so we are able to actually work with our dataset and come to some kind of conclusion. A technological limitation that we also currently have is that we would like to make an interactive data visualization using maps and the data, but we simply do not know how to code that yet. We will work on learning more about how to actually build interactove data visualizations, but currently that is a limitation that will impact how useful our report is.  


## References

Bach, K. (2022, August 24). New data shows long covid is keeping as many as 4 million people out of work. Brookings. Retrieved October 30, 2022, from https://www.brookings.edu/research/new-data-shows-long-covid-is-keeping-as-many-as-4-million-people-out-of-work/ 

Bryant, M. (2022, October 26). Internet service offers dataset. Kaggle. Retrieved October 30, 2022, from https://www.kaggle.com/datasets/michaelbryantds/internet-speeds-and-prices?resource=download&amp;select=speed_price_att.csv 

Kochhar, R., &amp; Bennett, J. (2021, April 14). U.S. labor market inches back from the COVID-19 shock, but recovery is far from complete. Pew Research Center. Retrieved October 30, 2022, from https://www.pewresearch.org/fact-tank/2021/04/14/u-s-labor-market-inches-back-from-the-covid-19-shock-but-recovery-is-far-from-complete/ 

Sankin, A., & Yin, L. (2022a). speed_price_att [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att.csv.gz

Sankin, A., & Yin, L. (2022b). speed_price_att_other_cities [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_att_other_cities.csv.gz

Sankin, A., & Yin, L. (2022c). speed_price_centurylink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_centurylink.csv.gz

Sankin, A., & Yin, L. (2022d). speed_price_earthlink [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_earthlink.csv.gz

Sankin, A., & Yin, L. (2022e). speed_price_verizon [Data set]. In Github. https://github.com/the-markup/investigation-isp/blob/main/data/output/speed_price_verizon.csv.gz


Winter, A. E. (2022, August 24). Yes, FCC affordable connectivity program's $30 discount is real. verifythis.com. Retrieved October 30, 2022, from https://www.verifythis.com/article/news/verify/money-verify/fcc-affordable-connectivity-program-30-dollar-internet-discount-real/536-c1de0bfb-4545-43bc-9bd8-4219d6b9f040 
