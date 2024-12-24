# MSHT_Trip_Analysis

Analyzing trip data, enabling efficient reporting and data-driven insights into trip durations, station usage, bike utilization, and passholder behavior. This model supports business metrics to optimize resource allocation, understand customer preferences, and improve operational planning in a bike-sharing or urban transportation context.

# Business Requirement:

Analyze Bike Usage Patterns: We desire to understand the trend in the usage of bikes concerning average duration of a trip, hours of the day that a bike is most in demand, and popular starting and stopping stations.

Optimize Station Distribution: We will identify the most frequent starting and stopping stations for the recommendation of locations for new bike stations or relocation of those already in place.

Improve the Customer Experience: We will analyze how different pass types, among others, such as Monthly Pass, Walk-up, influence riding behavior to offer better personalization of membership offers as well

# Functional Requirement: 

Upload New Data: Data upload functionality shall be provided to the administrator for uploading the new dataset in order for the system to always remain up-to-date on the latest trip data. 

Filtering and Searching Capabilities: Enable users to filter the data such as on parameters related to trip duration, starting and ending location, date, and type of pass.

Visualize Usage Trends: Provide graphs on the trend of usage across time; that is, a pattern of day-to-day, week-to-week, and month-to-month use.

Station Analysis Reporting: Reports that will summarize the key metrics of the station include total trips per station, average duration of trips, and the most popular routes.

Geographical Mapping: Display bike trip routes on a map with starting and ending latitude and longitude coordinates.

# Data Explanation: 

Data for this project might come from any source listing trip-related information and could include records of transportation services for trips enabled in ride-sharing, taxi, or public transit trips. Many trip datasets contain a very large volume of detailed records, kept by companies or agencies for the purposes of analyzing trip behaviors, route optimization, times of highest usage, and general service quality. 

Every record in a trip dataset would normally have several attributes, including - Trip ID: Unique identifier for each trip. Pickup and Drop-off Locations: Information about the origins and destinations of each trip, either as GPS coordinates or specific zones. Timestamps: Time of pickups and drop-offs. This information will  indicate how long a certain trip has taken and at what time of day peak travels are made. Distance: Total distance traveled, in miles or kilometers. Fare and Additional Fees: This is financial information, at times including fare amount, surcharges, and tips, hence this provides insight into revenue generation. Trip Purpose or Mode: Details, if available, on whether for business, leisure, or a particular mode taken-for example, pool or premium. 

The data is then arranged in fact and dimension tables within a star schema that allows, with minimal query complexity, insight to be gained on the nature of travel patterns, costs, and user behavior.

Source: https://catalog.data.gov/dataset/metro-bike-share-trip-data 

# Information Architechture: 

![Information Architecht](https://github.com/user-attachments/assets/1ee07542-a4f7-4359-ab35-2de759393981)

The data used in this research comes from a website designed to retrieve unprocessed data on different travels. To make sure the process runs well, such data is first removed and momentarily stored in a staging area. Because it serves as a buffer and guards against data loss or collision in the event of unexpected pauses or failures during the extraction process, this type of temporary storage is essential. To make sure that the extracted data does not collide, the replication layer as a temporary storage can support the data processing pipeline in a simultaneous way to recovery in the event of problems. To ensure accuracy, the captured data is cleaned. Cleaning is an important process since it fixes errors and improves the quality. The procedure includes the following tasks: imputation of missing values, format standardization, eliminating duplicates, and data corrections. After cleaning, the data is reshaped and changed to make it feasible. Finally, the structured dataset is put into a data warehouse. At this level, the trip data is separated into fact and dimension tables in a star schema architecture to enable effective analytics. With the help of this schema, users may  examine data on various time, location, and trip-related variables to gain insightful knowledge about things like popular routes, fare patterns, peak usage periods, and much more. From extraction to loading, our data pipeline guarantees that the final dataset is correct and comprehensive, allowing it to be pre-loaded for additional analysis.

# Data Architechture: 

![Data Architecht](https://github.com/user-attachments/assets/6c693668-c1c2-4c2e-9009-46c5f232aad3)

The data architecture for this project starts initially by extracting data which is stored to guarantee data stability and integrity. As a precaution, this temporary store keeps a backup in case of data collisions. This architecture preserves an unchanged copy of the data that may be retrieved and reprocessed if necessary by establishing this intermediate layer. After the first phase, the data is sent to a Data Mart which is used for  analytical processing. After the second process, the data is further transformed to get it ready for viewing after being stored in the Data Mart. In this stage, data is compiled to develop its analytical use. Data is organized to provide graphical representations like barcharts, graphs, and dashboards in the last stages of visual processing as a part of data visulaization. This layered data architecture gives users an effective, organized pipeline that improves data-driven insights and makes decision-making easier, from temporary storage and Data Mart to transformation and display.


# Dimensional Model: 

![Dimensional Model (1)](https://github.com/user-attachments/assets/282fde9b-8011-42c4-b9be-587f76d2d4c2)

# Technical Architechture:

![image](https://github.com/user-attachments/assets/5ea0e1e8-5ae5-4e1b-aa76-7f416f3f3921)

This diagram illustrates a modern data pipeline for processing and analyzing data. The process begins with data being sourced from Data.gov, a platform providing open government datasets. The raw data is extracted and stored in Microsoft Azure Blob Storage, a scalable and secure cloud storage solution. From there, the data is loaded into Snowflake, a powerful cloud-based data warehouse that enables fast and efficient querying. In the next step, SQL-based transformations are performed using dbt (data build tool), which allows for modular, version-controlled data modeling and cleaning. These transformations ensure the data is structured, clean, and ready for analysis. Finally, the processed data is visualized using Tableau, a leading data visualization tool, to create interactive dashboards and reports, enabling stakeholders to derive meaningful insights. This workflow demonstrates a robust Extract, Load, and Transform (ELT) process designed for scalability, flexibility, and efficient decision-making.

# Transformation To Datawarehouse

![image](https://github.com/user-attachments/assets/475927d1-a131-4dab-b7b6-e89c09275e82)

This SQL script creates a table in the TEST schema using a Common Table Expression (CTE) named Bike_cte. The script extracts data from the ROW_LOCATION table in the SPRINGBOARD.TEST schema. It selects key fields, specifically BIKE_ID and TRIP_ID, and assigns them meaningful aliases to represent their purpose. The SELECT * FROM Bike_cte statement retrieves all rows from the CTE, producing a clean and structured dataset containing information about bike trips. This table is designed to facilitate further analysis of bike-related activities, enabling insights into trip patterns and bike utilization.

![image](https://github.com/user-attachments/assets/2cf9c46a-c072-4e61-8342-2d4c3b2438c1)

This SQL script creates a date-time dimension table (dim_datetime) within the TEST schema to enable detailed temporal analysis for trip data. It first uses a Common Table Expression (CTE), raw_date_cte, to extract and standardize raw date-time data from the START_TIME field in the ROW_LOCATION table, converting it into a consistent timestamp format (ISO_TIMESTAMP_EST) using the TO_TIMESTAMP function. A second CTE, date_cte, generates a range of date-time attributes from this standardized timestamp, including a unique date_id in YYYYMMDDHH format, numeric values for year, month, day, hour, and quarter, as well as textual representations of the month and day. It also derives week-related metrics like week_of_month and week_of_year, providing granular time-based segmentation. The final table outputs all these attributes, creating a structured dataset ideal for trend analysis, temporal filtering, and reporting in analytics workflows.

![image](https://github.com/user-attachments/assets/8b5e2f5e-b71e-4fd0-951f-a6b861d8e917)

This SQL script creates a passholder dimension table (dm_passholder) in the TEST schema to provide structured information about trip-related passholders. It uses a Common Table Expression (CTE) named passholder_cte to extract key attributes from the ROW_LOCATION table in the SPRINGBOARD.TEST schema. The script selects fields such as TRIP_ID, renamed as TRIP_ID, PASSHOLDER_TYPE, and PLAN_DURATION, organizing the data for clarity and usability. The final SELECT * retrieves the processed data, creating a structured table that can be used for analyzing passholder behaviors, subscription types, and plan durations to inform customer-focused decisions in analytics workflows.


![image](https://github.com/user-attachments/assets/77b72c90-120c-450a-9505-13d43b1c1be1)

This SQL script creates a route dimension table (dm_route) in the TEST schema to facilitate the analysis of trip route categories. It uses a Common Table Expression (CTE) named Bike_cte to extract key attributes from the ROW_LOCATION table in the SPRINGBOARD.TEST schema. The script selects and renames columns, including TRIP_ID and TRIP_ROUTE_CATEGORY, to structure the data for better usability. The final SELECT * retrieves all the processed data, creating a structured dataset that supports analytics on trip routes and their classifications, providing insights into route preferences and usage patterns.


![image](https://github.com/user-attachments/assets/6c43582f-1e9c-48bf-b916-6ecd455af95c)

This SQL script creates a station dimension table (dm_stations) within the TEST schema to organize and analyze data related to trip start and end stations. The script utilizes a Common Table Expression (CTE) named station_cte to extract key attributes from the ROW_LOCATION table in the SPRINGBOARD.TEST schema. It retrieves and renames fields for both ending and starting stations, including their IDs, latitudes, and longitudes, ensuring clarity and usability. The final SELECT * statement outputs the processed data, creating a structured dataset that enables analysis of station-related metrics such as trip origins, destinations, and geographical patterns, essential for optimizing station placement and usage.


![image](https://github.com/user-attachments/assets/8ebf428b-754a-481d-9a24-2b932f9aa569)

This SQL script creates a fact table (fact_trips) in the TEST schema to capture detailed trip data for analytics purposes. Using a Common Table Expression (CTE) named raw_fact_cte, it extracts and renames fields from the ROW_LOCATION table in the SPRINGBOARD.TEST schema. The fields include trip-specific details such as trip_id, durations, plan_duration, passholder_type, and trip_route_category, along with references to associated stations (start_station_id, end_station_id) and bikes (bike_id). Additionally, surrogate keys for time dimensions are generated by converting the START_TIME and END_TIME fields into formatted strings (start_time_key, end_time_key) for easier integration with date-time dimensions. The final SELECT * retrieves the structured data, creating a robust dataset for analyzing trip patterns, durations, and station utilization, enabling data-driven decisions for trip optimization.



# Result:

![image](https://github.com/user-attachments/assets/f7a1afe6-422d-413e-a272-33459598f12e)

This is a horizontal bar chart visualization of the Top Trip Duration per Bike ID, where each bar characterizes a specific bike's overall trip duration in seconds. The Bike ID is identified along the y-axis, while the total duration (in seconds) is represented on the x-axis. The graph is sorted in descending order according to trip duration: starting with the bike that had the highest total duration-which is Bike ID number 6058 with a duration of 91,200 seconds. The chart allows for the immediate identification of the bikes with the longest trip durations, further helping analyze usage patterns or demand for specific bikes. The close clustering of values among the top bikes suggests a relatively small variation in trip durations for these top performers, with all bikes in the top 10 having durations between approximately 63,000 and 91,200 seconds. This kind of visualization is useful for fleet performance analysis and operational planning.

![image](https://github.com/user-attachments/assets/8e14153a-1275-4f64-9fda-834e8950c305)

This is the visual representation using a pie chart for different Passholder Types' distributions of counts for trips taken. The passholder type is assigned to each slice in this pie chart; the proportion or size relates to the number of that group making a certain number of trips.

The above chart highlights that the largest portion by category is:

The domination by Monthly Pass, with 265 trips - over half the total -.
The Walk-up category follows with 194 trips, representing a significant portion of the trips.
The Flex Pass category contributes to 38 trips.
The Staff Annual category has the smallest contribution, with only 3 trips.
This visualization provides an at-a-glance understanding of how passholder types contribute to the overall trip activity, with the indication that Monthly Pass users are the most active and Staff Annual users represent a very small fraction of the trips. This kind of insight is useful to understand customer behavior and plan for targeted services.

![image](https://github.com/user-attachments/assets/74f8491d-3554-4ccc-95ef-83aec4fe971a)

This line chart visualizes the Number of Trips Per Day, showing how daily trip activity has changed during the period under observation. The x-axis represents the number of days, and the y-axis shows the count of trips taken on any given day. The chart shows a remarkable variation; some days show high peaks, such as day 17 and its surroundings, while others are low, like day 23. Such peaks could be related to favorable weather, special events, or weekends when users would be more likely to take leisure trips. On the other hand, the dips may represent weekdays with less leisure travel, poor weather conditions, or other factors that contribute to fewer bikes being taken out. The pattern in this chart indicates either cyclic or contextual influences on the counts of trips per day. For example, a steady climb in trip counts for some days of the week may mirror commuter behavior, while spiked peaks may indicate one-off events. Knowing this can be important for operational planning. For instance, higher-demand days might require more bikes and maintenance support to accommodate the users, while on days with low demand, redistribution of bikes or even bike servicing may be possible. By looking at longer trends of such analysis, organizations could make good predictions about their demands in the future and adequately use resources to ensure improved services and customer satisfaction.

![image](https://github.com/user-attachments/assets/e03e0cdc-05cf-49a7-92e8-00a20e165a55)

This above visualization is a geographical map of starting and ending points of the trips based on their latitude and longitude coordinates. Red dots on the map visualize the exact geolocations where trips either start or end. The tendency of dots to cluster in certain areas can be seen, hence showing regions of high activity, which therefore might imply these are starting or ending points for the trips.From this visualization, we can notice that activity is concentrated around a tightly clustered region that probably marks the central hub or focal area, like the center of a city, a transport station, or an area of recreation. The dots that exist farther away from the primary cluster may show either the initiation or termination of trips outside of the high-frequency zones, which can be explained by the rare use of bikes in further areas. This kind of map is useful in understanding the spatial patterns of trip behavior, identifying high-demand locations, and informing infrastructure improvements, such as bike stations, parking, or maintenance facilities. It also helps assess whether resources are being effectively distributed to meet user needs in different areas. Insights from this map can be used to optimize bike-sharing services, ensure equitable coverage, and enhance user satisfaction.

# Future Work:

In the future, this project can be further enhanced by adding real-time data processing to present live insights into bike usage patterns, station demand, and resource optimization. Advanced machine learning models could be implemented to predict usage trends, such as times of peak demand, underutilized stations, and optimization of bike redistribution strategies. Moreover, the integration of external data such as weather conditions, events in the area, and demographic information can set the backdrop for a more meaningful understanding of trip behavior. Enriching the geographical mapping feature with heat maps and predictive overlays can also enhance visualization and decision-making capabilities. Finally, the development of an easy-to-use mobile application or dashboard for stakeholders will enhance accessibility and provide dynamic interaction with the data, allowing for better-informed operational planning and customer service initiatives.




