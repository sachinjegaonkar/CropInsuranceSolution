# The Crop Insurance Solution

⚙️ Decentralized Crop Insurance Solution

Problem Statement
==================

The problem statement was a part of [Icertis AI/ML and Blockchain Online Hackathon Phase - Idea Submission and Prototype Building - Round 2](https://www.techgig.com/hackathon/icertis-hackathon) held from 18th October to 24th November, 2019.

1. Provide an easy to use, secure interface to manage insurance policies, farm details and other information through a website and/or mobile app.
2. Use block chain technology to design a solution that will allow a secure, technology based, and fast settlement of crop insurance claims
3. Integrate weather data to determine drought or excessive rainfall at farm locations to automatically trigger settlements

The stakeholders involved in the Crop Insurance Solution are as mentioned below -
1. Farmers - Registers for Insurance
2. Weather Data Providers - Manages Weather Data
3. Insurance Companies
4. Service Provider - Design Insurance Policies
5. Technology Solution Provider – UI, Application and Blockchain Layer


Abstract
==================

Farmers in developing countries like India have always been at the mercy of the weather. Changing weather patterns have further aggravated the problem. When a natural calamity strikes, farmers need help immediately! One way to ensure they get help quickly when disaster hits, is to provide insurance to farmers at an affordable cost. Easy, trusted and affordable crop insurance is therefore crucial, not just for the well-being of farmers but also for the food security of the nation. Traditional forms of crop insurance are slow, capital-intensive and often economically unviable for private businesses.  Farmers are also unwilling to get their crops insured because of a lack of trust in the insurance companies and the fear of delayed/non-payment of claims.

An open, trusted, low-cost and automated crop insurance system will ensure that many more farmers come under the insurance umbrella and benefit from timely crop insurance payments. The cost of administering insurance is currently a significant barrier to entry into this space. This cost can be reduced dramatically with the right use of technology. It will open up a vast new market for efficient and competitive private businesses while at the same time addressing a vital social need and limiting the need for government intervention.


Problems with Traditional Insurance
==================

* Large Players Dominates the Market and Reap Benefits
* Farmers Feel Treated Unfairly, Don’t Understand Policies
* Insurance Companies Have Different Reasons To Not To Pay Out Claims
* Insurance Companies are Having No Trust and Transparency
* Tight Regulation is Needed to Protect Farmers
* Conflict of Information Between Farmers and Insurance Companies


Technology
=====================

The Icertis AI ML Blockchain Hackathon is an Azure Cloud-only Hackathon, with all solutions to be built and evaluated on the Azure Cloud. 
1. Azure Free Trial and Developer Resources: http://aka.ms/hack.azure
2. Please plan your free trial periods so that your submission is active for evaluation till the 15th of December. 
3. You might have to create multiple free trial accounts in a staggered fashion.


Methodology
=====================

1. User interface: Provide an easy to use interface to gather farmer personal data, farm coordinates and crop information for a particular year. Build responsive UI web pages that will also be rendered correctly on an iPhone or an Android phone browser
• Stretch goal: build a mobile app on the iPhone or Android
• Stretch goal: support one more language in addition to English as the UI and the insurance policy document
2. The web page/app should allow a farmer to take a picture of his/her insurance policy and upload it.
3. When the insurance policy is uploaded, the following information should be automatically extracted from the uploaded image (insurance policy examples that you can use to test will be provided) Unique policy number, Amount Insured, Start Date, Expiry Date and Geo coordinates of the farm as vertices of a polygon
4. The extracted information, after it is validated by the farmer, should be written to the blockchain with the insurance policy document as a smart contract as described below
5. Create a blockchain using Azure Blockchain as a Service (required)
6. Set up a smart contract : The smart contract should consult an Oracle, and if the insurance policy is in effect (date between start date and expiry date), check if the geo-coordinates are within the areas marked as under drought by the Oracle service (the Oracle service will return an entire set of polygonal vertices of areas under drought)
7. Integrate and analyze real-time weather data with analysis of weather conditions for farm coordinates. 
8. Determine whether weather conditions at the farm coordinates in a given period have resulted in a drought or excessive rainfall. If they have, determine the amount to be paid to the farmer based on the insurance policy, weather severity and duration, crop type, crop status and farm location. 
• A simple illustrative calculation could be:
• In the 6 month period, (drought condition at farm location > 15 days), crop = rice, farming period = seed sowing) results in payment of 100% of amount insured
• If the drought condition at farm location < 7 days, the payment could be 25% of the amount insured
9. The farm will be said to be under drought if it is fully enclosed within the area under drought from the Oracle. If the farm is under drought, the smart contract should execute to release a payment automatically to the farmer. A smart contract solution using Azure Blockchain between farmers, weather data providers, insurance company and technology solution provider.
10. Allow for participation of insurance providers and regulators in the system through the block chain
11. Design a secure and credible system with the right use of technology.


Criteria
=====================

Submissions will be evaluated on the following, not in any particular order:
1. Working UI, Blockchain and smart contract implementation.
2. It works end to end! 
3. Accuracy of data extraction
4. Accuracy of drought detection
5. User experience
6. Innovation and Problem-Solving capability
7. Scale and performance
8. Extensibility
9. Efficient use of Azure resources
10. Team work


Technology/Tool/Cloud Stack
=====================

* Ethereum Smart Contracts – Solidity
* Microsoft Azure – Cloud Platform to Host the Blockchain Service
* Machine Learning – For Weather and Wind Data Analysis
* HTML5, JavaScript, Node.js and Web3.js – User Interface
* Ropsten TestNet – Test Framework
* Truffle framework
* MetaMask – Digital Wallet Provider
* Remix IDE – Development Environment
* Mobility – Mobile Interface


Deliverables
=====================

* UI (User Interface)
* DApp (Middleware to connect to Blockchain)
* Smart Contracts
* The Ethereum based Blockchain Network


Problems Being Solved
=====================

* Increased Efficiency for Farmers
* Fairer Payment for Farmers
* Farmers can Quickly get the Claims through Smart Contracts
* Farmers can Take Preventive Actions
* Eliminates the lack of Trust and Transparency
* Eliminates the Existence of Middleman
* Decentralised System
* More Secure


Demonstration Video/Prototype Demo [Not Yet Ready]
=====================

[![Watch the Demo](https://github.com/sachinjegaonkar/CropInsuranceSolution/blob/master/Crops.jpg)](https://github.com/sachinjegaonkar/CropInsuranceSolution)


Extended Work – Application is Scalable
=====================

* Scale this solution to Transform the Way Crops or Food Items are Produced to Improve the Quality Control and Food Safety
* Scale this solution to Improve the Traceability in the Supply Chain and to Reduce the Food Frauds
