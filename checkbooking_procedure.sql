DELIMITER //
CREATE PROCEDURE `CheckBooking` (IN dateAp DATETIME, IN tableNum INT, OUT bookingStatus  VARCHAR(100))
BEGIN
	DECLARE reservation_count INT;

    SELECT COUNT(*) INTO reservation_count
    FROM booking
    WHERE BookingSlot = dateAp AND TableNo = tableNum;

    IF reservation_count > 0 THEN
        SET bookingStatus = f" Table No: {dateAp} is not booked";
    ELSE
        SET bookingStatus = f" Table No: {dateAp} is already booked";
    END IF;
END//
DELIMITER ;

