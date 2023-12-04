CREATE PROCEDURE `UpdateBooking` (
    IN p_BookingID INT,
    IN p_TableNo INT,
    IN p_CustomerID INT,
    IN p_BookingSlot DATETIME
)
BEGIN
    UPDATE `mydb`.`Bookings`
    SET `TableNo` = p_TableNo,
        `CustomerID` = p_CustomerID,
        `BookingSlot` = p_BookingSlot
    WHERE `BookingID` = p_BookingID;
END