CREATE DEFINER=`admin`@`%` PROCEDURE `CheckBooking`(booking_date DATE, booking_time TIME, table_number INT)
BEGIN
DECLARE status_of_table VARCHAR(255) DEFAULT "is available";
IF table_number IN (SELECT TableNumber FROM Bookings WHERE BookingDate = booking_date AND BookingTime = booking_time) THEN SET status_of_table = "is already booked";
END IF;
SELECT CONCAT("Table ", table_number, " ", status_of_table, " for ", booking_time, " on ", booking_date) AS "Booking Status";
END