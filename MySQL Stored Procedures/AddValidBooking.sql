CREATE DEFINER=`admin`@`%` PROCEDURE `AddValidBooking`(booking_date DATE, booking_time TIME, table_number INT, number_of_guests INT, customer_id INT)
BEGIN
DECLARE status_of_table VARCHAR(255) DEFAULT "is available - booking confirmed";
START TRANSACTION;
INSERT INTO Bookings (BookingDate, BookingTime, TableNumber, NumberOfGuests, CustomerID) 
VALUES (booking_date, booking_time, table_number, number_of_guests, customer_id);
IF (SELECT COUNT(customerID) FROM Bookings WHERE BookingDate = booking_date AND BookingTime = booking_time AND TableNumber = table_number) > 1 THEN
SET status_of_table = "is already booked - booking cancelled";
END IF;
IF status_of_table = "is already booked - booking cancelled" THEN ROLLBACK;
ELSE COMMIT;
END IF;
SELECT CONCAT("Table ", table_number, " ", status_of_table) AS "Booking Status";
END