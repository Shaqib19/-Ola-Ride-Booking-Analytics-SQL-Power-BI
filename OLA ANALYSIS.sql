use ola;
select*from bookings;

# Q1 Retrieve all the successful booking
create view Successful_Bookings as
select count(*),booking_status from bookings where booking_status='success';
select * from successful_bookings;

# Q2 Find Average ride distance for each type
create view Avg_Distance_by_Vehicle_type as
select avg(ride_distance) as avg_distance,vehicle_type from bookings group by vehicle_type;
select*from avg_distance_by_vehicle_type;

# Q3 Total Number Of Canceled Rides By Customers
create view canceled_ride_as_customers as
select count(booking_status) from bookings where booking_status='Canceled by Driver';
select*from canceled_ride_as_customers;

# Q4 List the Top 5 customers who booked the highest number of rides
create view top_5_customers as
select customer_id,count(booking_id) as total_rides from bookings group by customer_id order by total_rides desc limit 5;
select * from top_5_customers;

# Q5 Get the number of rides Canceled by Drivers due to personal and car-related issues
create view Ride_cancelled_personal_car_related_issues as
select count(canceled_rides_by_driver) as rides_cancelled from bookings where canceled_rides_by_driver='personal & car related issue';
select*from ride_cancelled_personal_car_related_issues;

# Q6 Find Maximum and minimum driver ratings For Prime sedan
create view Highest_and_lowest_PrimeSedan_ratings as
select max(driver_ratings) as highest_rating,min(driver_ratings) as lowest_rating from bookings where vehicle_type='prime sedan';
select * from highest_and_lowest_primesedan_ratings;

# Q7 Retrieve All The Ride Where Payment Was Made Using Upi
create view Payments_Made_by_UPI as
select * from bookings where Payment_method='UPI';
select*from Payments_made_by_UPI;

# Q8 Average Customer Rating Per Vehicle
create View Average_Rating_by_Vehicle as
select avg(customer_rating) as Avg_Cst_Ratings,vehicle_type from bookings group by Vehicle_type;
select*from Average_rating_by_vehicle;

# Q9 Calculate the total booking values of ride Completed Successfully
create view Total_Amount_For_completed_rides as
select sum(Booking_value) as Total_Amount From Bookings where Booking_status='Success';
select*from total_amount_for_completed_rides;

# Q10 List All Incomplete RIdes Along With The Reason
create view incomplete_rides_reason as
select booking_id,incomplete_rides_reason from bookings where incomplete_rides='YES';
select*from incomplete_rides_reason