create database ola;
use ola;
#1. Retrieve all successful bookings:
create view	Successful_Bookings as
select *from Bookings where Booking_Status='Success';

select *from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:

create view ride_distance_for_each_vehicle_type as
select Vehicle_Type,avg(Ride_Distance) as avg_distance from Bookings 
group by Vehicle_Type;
select *from ride_distance_for_each_vehicle_type;

#3. Get the total number of cancelled rides by customers:

create view number_of_cancelled_rides_by_customers as
select count(*) from Bookings where Booking_Status='Canceled by Customer';
select *from number_of_cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
create view highest_number_of_rides as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
 FROM bookings
 GROUP BY Customer_ID
 ORDER BY total_rides DESC LIMIT 5;
 
 select *from highest_number_of_rides;
 
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view personal_and_car_related_issues as
select *from Bookings where Canceled_Rides_by_Driver="Personal & Car related issue";

select *from personal_and_car_related_issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

 Create View Max_Min_Driver_Rating As
 SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating
 FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
 
select *from Max_Min_Driver_Rating;


#7. Retrieve all rides where payment was made using UPI:
create view payment_method_UPI as
select *from Bookings where Payment_Method='UPI';

select *from payment_method_UPI;

#8. Find the average customer rating per vehicle type:
create view customer_rating as
select Vehicle_Type,avg(Customer_Rating) from Bookings group by Vehicle_Type;

select *from customer_rating;

#9. Calculate the total booking value of rides completed successfully:

create view total_successful_rides as
select sum(Booking_Value) as total_successful from Bookings where Booking_Status='Success';

select *from total_successful_rides;

#10. List all incomplete rides along with the reason:

create view incomplete_rides as
select Booking_ID,Booking_Status,Incomplete_Rides_Reason FROM Bookings where Incomplete_Rides='Yes';

select *from incomplete_rides;

create view correct_incomplte_rides_query  as
select Booking_ID,Incomplete_Rides_Reason,Incomplete_Rides FROM Bookings where Incomplete_Rides='Yes';

select *from correct_incomplte_rides_query;


