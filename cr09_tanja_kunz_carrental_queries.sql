-- times a car was times booked 
-- ==========================================================

SELECT car.car_id, car_model.make, car_model.model, count(rental.booking_id) AS times_booked from car_model
INNER JOIN car ON car_model.model_id = car.model_id
INNER JOIN rental ON car.car_id = rental.car_id
GROUP BY car_id


-- how long a customer rented a car and what car 
-- ==========================================================

SELECT rental.booking_id, customer.first_name, customer.last_name, car_model.make, car_model.model, dispatch.dispatch_date, car_return.return_date FROM customer
INNER JOIN rental ON rental.customer_id = customer.customer_id
INNER JOIN car ON rental.car_id = car.car_id
INNER JOIN car_model ON car.model_id = car_model.model_id
INNER JOIN dispatch ON rental.booking_id = dispatch.booking_id
INNER JOIN car_return ON rental.booking_id = car_return.booking_id


-- cars that got removed from fleet
-- ==========================================================

Select car.car_id, car_model.make, car_model.model, car.removal_date FROM car
INNER JOIN car_model ON car.model_id = car_model.model_id
WHERE car.removal_date < curdate()


-- how many times a dispatch from locations hat taken place
-- ==========================================================

SELECT locations.loc_city, count(dispatch.location_id) AS times_dispatched FROM locations
RIGHT JOIN dispatch ON locations.location_id = dispatch.location_id
GROUP BY locations.location_id



