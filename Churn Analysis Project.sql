-- Name = Karan Rajesh Sawant
-- Project Name = Churn Analysis. 

-- Q1) Create database. 
create database if not exists churn_analysis;

-- Q2) Import the churndata.csv into the database as a table. 
use churn_analysis;

-- Q3 Find the number of unique customers present in the data. 
select distinct (customerid) 
from churndata;

-- Q4) Find the number of customers who have left vs. those who haven't. 
select churn, count(customerid) 
from churndata 
group by churn;

-- Q5) Find the top two company IDs with the highest total charges
-- (from the Totalcharges column) for those who were taking all the 
-- services offered but still decided to leave the company.   
select customerid 
from churndata 
where
 PhoneService !="no" and	
 InternetService !="no" and	
 OnlineBackup !="mo" and 
 DeviceProtection !="no" and	
 TechSupport !="no" and	
 StreamingTV !="no" and	
 StreamingMovies !="no" and
 churn ="no"
 order by totalcharges 
 desc limit 2;
 
 -- Q6 Find the average tenure and average monthly charges
 -- by gender 
 -- for those who stopped being customers. 
 select gender,churn, avg(tenure), avg(monthlycharges) 
 from churndata 
 group by gender,churn 
 having churn ="no";
 
 -- Q7) Write a query to understand the split of customer IDs 
 -- by churn and seniorcitizen column and
 -- find if the average of the Totalcharge column are higher
 -- for senior citizens or nonsenior citizens. 
 select * 
 from churndata;
 select churn,seniorcitizen, avg(TotalCharges) as average_charges 
 from churndata 
 group by  churn,seniorcitizen 
 order by average_charges desc;
 
 -- Q8) Display the mode of payment preferred by those who are no longer
 -- customers (from the paymentmethod column) 
 -- and those who still are in descending order of totalcharge with
 -- only those customer who have paid more then 10000rs.  
 select churn,paymentmethod, sum(totalcharges)
 from churndata 
 group by churn,paymentmethod 
 having sum(totalcharges)>10000 
 order by sum(totalcharges)  desc ;
 
 -- Q9) Find the number of people who are no longer customer
 -- who were only taking the phone services,the internet services or both
 -- and exclude those who were using fiber-optic internet services. 
 select churn,internetservice,phoneservice, count(customerid) 
 from churndata 
 group by churn,internetservice,phoneservice
 having (PhoneService ="yes" and	
 InternetService !="yes" or internetservice !="no") and InternetService !="fiber optic" and churn="no" ;
 





