# CIS9440-HW

# Brooklyn Bridge Pedestrian Count Analysis

## Project Overview
This project analyzes pedestrian traffic data on the Brooklyn Bridge to provide insights into pedestrian movement patterns, the impact of weather conditions, and event-driven traffic variations. The analysis is part of a demonstration project by the Department of Transportation (DOT) to test automated technology for counting pedestrians. The primary goal is to create visualizations that help in understanding pedestrian flow, peak traffic times, and how external factors like weather and events affect pedestrian counts. The project leverages Amazon Redshift for data warehousing and AWS QuickSight and Power BI for data visualization.

## Information Architecture
![Information Architecture](https://github.com/MMomin92/CIS9440-HW/assets/159973038/9bcc7fa1-c710-4217-9ce6-d92bd6b451b0)

### Description
1. **Extract**:
   - **Source NYC OpenData**: Data is sourced from the NYC Open Data API.
   - **Raw Data AWS S3**: The raw data is stored in an AWS S3 bucket.

2. **Transform**:
   - **Data Processing (Python)**: Python scripts process the raw data, performing necessary transformations and cleaning.
   - **Dimensional Modeling (Tables)**: The cleaned data is structured into fact and dimension tables.

3. **Load**:
   - **Data Loaded into Tables**: The processed data is loaded into Amazon Redshift.
   - **Redshift DW**: The data warehouse in Amazon Redshift stores the structured data.
   - **Visualizations (PowerBI)**: Data is visualized using Power BI.

## Introduction
### Background
The project aims to conduct an in-depth analysis of pedestrian traffic on the Brooklyn Bridge. By leveraging data from various sources, the project seeks to extract valuable insights to aid in understanding pedestrian movement patterns, the impact of weather conditions, and event-driven traffic variations.

### Business Problem
**Description**: Pedestrian traffic on the Brooklyn Bridge varies based on several factors, including time of day, weather conditions, and special events. Understanding these patterns is crucial for city planning, event management, and ensuring pedestrian safety.

**Requirements**:
- Analyze total pedestrian counts by time, direction, and weather conditions.
- Visualize pedestrian traffic patterns to identify peak hours and impact of weather.
- Provide insights into pedestrian flow during special events.

### Business Impact
**Potential Benefits**:
- Improved decision-making for city planners and event managers.
- Enhanced safety measures for pedestrians.
- Better understanding of how external factors influence pedestrian traffic.

**Risks and Challenges**:
- Data quality issues such as missing or inaccurate information.
- Interpretation biases that may arise from the analysis.
- External factors impacting pedestrian traffic patterns.

## Data
### Data Sources
- **Pedestrian Count Data**: Obtained from the [Brooklyn Bridge Pedestrian Counts](https://data.cityofnewyork.us/Transportation/Brooklyn-Bridge-Automated-Pedestrian-Counts-Demons/6fi9-q3ta/about_data).
- **Weather Data**: Retrieved from the pedestrian count dataset.
- **Event Data**: Retrieved from the pedestrian count dataset.

### Metadata
- **Pedestrian Count Data**: Includes counts, direction (towards Manhattan or Brooklyn), and timestamps.
- **Weather Data**: Includes weather conditions, temperature, and precipitation.
- **Event Data**: Includes information on special events (e.g., holidays).

### Data Dictionary
Summary
| Column Name       | Description                               | Data Type | Constraints |
|-------------------|-------------------------------------------|-----------|-------------|
| Date              | Date of the pedestrian count              | DATE      | NOT NULL    |
| Year              | Year of the pedestrian count              | INT       | NOT NULL    |
| Quarter           | Quarter of the year                       | INT       | NOT NULL    |
| Month             | Month of the pedestrian count             | INT       | NOT NULL    |
| Day               | Day of the month                          | INT       | NOT NULL    |
| Hour              | Hour of the pedestrian count              | INT       | NOT NULL    |
| Pedestrians       | Total pedestrian count                    | INT       | NOT NULL    |
| Towards Manhattan | Pedestrians moving towards Manhattan      | INT       | NULLABLE    |
| Towards Brooklyn  | Pedestrians moving towards Brooklyn       | INT       | NULLABLE    |
| Weather           | Weather conditions during the count       | VARCHAR   | NOT NULL    |
| Temperature       | Hourly temperature in Fahrenheit          | FLOAT     | NOT NULL    |
| Precipitation     | Hourly precipitation in inches            | FLOAT     | NOT NULL    |
| Events            | Special events or holidays                | VARCHAR   | NULLABLE    |


### Data Size
- The pedestrian count dataset consists of over 16,000 thousand records spanning multiple years.

### Strengths and Weaknesses
**Strengths**: Large dataset enables detailed analysis, diverse sources provide comprehensive insights.
**Weaknesses**: Data quality issues may require extensive cleaning and preprocessing.

## Dimensional Modeling
![Dimensional Model](https://github.com/MMomin92/CIS9440-HW/assets/159973038/58a2bd97-5443-4587-a8cc-5965f23188fb)

### Description
- **dim_weather**:
  - `weather_id`: Primary key.
  - `weather`: Description of the weather.
  - `temperature`: Hourly temperature in Fahrenheit.
  - `precipitation`: Hourly precipitation in inches.

- **dim_event**:
  - `event_id`: Primary key.
  - `event_name`: Name of the event/holiday.

- **dim_time**:
  - `time_id`: Primary key.
  - `date`: Date.
  - `year`: Year.
  - `quarter`: Quarter.
  - `month`: Month.
  - `day`: Day.
  - `hour`: Hour.

- **fact_pedestrian**:
  - `time_id`: Foreign key referencing `dim_time`.
  - `weather_id`: Foreign key referencing `dim_weather`.
  - `event_id`: Foreign key referencing `dim_event`.
  - `pedestrians`: Total pedestrian count.
  - `towards_manhattan`: Pedestrians moving towards Manhattan.
  - `towards_brooklyn`: Pedestrians moving towards Brooklyn.

## Methods
### Tools
- **Python**: Used for data processing and analysis using libraries such as Pandas, NumPy, and Matplotlib.
- **AWS Services**: Amazon S3 for data storage and Amazon Redshift for data warehousing.
- **Power BI**: Employed for creating interactive visualizations and dashboards.
- **DataGrip**: Used for database management and SQL scripting.
- **DBSchema**: Used in dimensional modeling process.

### Data Processing
**Steps**:
1. **Data Extraction**: Raw data retrieved from the NYC Open Data API.
2. **Data Cleaning**: Preprocessing involves handling missing values, standardizing formats, and resolving data inconsistencies.
3. **Data Integration**: Pedestrian count data integrated with weather and event data to create dimensional models for analysis.
4. **Dimensional Modeling**: Creation of dimensional models for pedestrian data to facilitate analysis and reporting.
5. **Aggregation and Summarization**: Aggregating data at different levels (e.g., by hour, weather) and summarizing key metrics for analysis.
6. **Quality Assurance**: Performing checks to ensure data accuracy, consistency, and completeness throughout the processing pipeline.

## Analysis and Insights
### Findings
- Insights gained include total pedestrian counts by hour, weather conditions, and direction.
- Classification by weather provides insights into how different conditions affect pedestrian traffic.
- Visualizations highlight traffic patterns, peak hours, and the impact of special events.

### Graph/Visualization Details
1. **Pie Chart: Distribution of Pedestrian Traffic by Weather Conditions**
   - **Data Used**: Total pedestrian counts and weather conditions.
   - **Purpose**: To show how pedestrian traffic is distributed across different weather conditions.

2. **Column Chart: Pedestrian Traffic by Hour**
   - **Data Used**: Hour and pedestrian counts.
   - **Purpose**: To visualize the flow of pedestrian traffic throughout the day, identifying peak and off-peak hours.

3. **Line Chart: Temperature Variations Throughout the Day**
   - **Data Used**: Hour and temperature.
   - **Purpose**: To observe how temperature varies throughout the day and if there's a noticeable pattern or correlation with pedestrian counts.

4. **Heat Map: Pedestrian Traffic by Day and Hour**
   - **Data Used**: Day, hour, and pedestrian counts.
   - **Purpose**: To visually represent the intensity of pedestrian traffic throughout different times of the day and across the week.

5. **Filtering Tool by Date or Dimension**
   - **Setup**: Implement slicers in Power BI and QuickSight for dynamic filtering.
   - **Purpose**: To allow users to customize the view of the data to see how pedestrian traffic changes under different conditions or on specific dates.

## Conclusion
### Impact and Recommendations
- **Impact**: Insights from the analysis can inform decision-making and strategic planning for city planners and event managers.
- **Recommendations**: Further analysis could include exploring the impact of different weather conditions on pedestrian safety and comfort. Continuous monitoring and updating of data recommended to track long-term trends.

### Next Steps
**Future Directions**:
- Explore additional datasets for a more comprehensive analysis.
- Implement machine learning models for predictive analysis and forecasting.
- Collaborate with stakeholders to address specific research questions or areas of interest.
