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

