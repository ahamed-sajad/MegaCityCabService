package com.megacitycabservice.model;

import java.sql.Timestamp;

public class Booking {
    private int bookingID;
    private int carID;
    private String carModel;
    private String licensePlate;
    private int driverID;
    private String driverName;
    private Timestamp bookingDate;
    private String status;

    // Constructor
    public Booking(int bookingID, int carID, String carModel, String licensePlate, int driverID, String driverName, Timestamp bookingDate, String status) {
        this.bookingID = bookingID;
        this.carID = carID;
        this.carModel = carModel;
        this.licensePlate = licensePlate;
        this.driverID = driverID;
        this.driverName = driverName;
        this.bookingDate = bookingDate;
        this.status = status;
    }

    // Getters
    public int getBookingID() { return bookingID; }
    public int getCarID() { return carID; }
    public String getCarModel() { return carModel; }
    public String getLicensePlate() { return licensePlate; }
    public int getDriverID() { return driverID; }
    public String getDriverName() { return driverName; }
    public Timestamp getBookingDate() { return bookingDate; }
    public String getStatus() { return status; }
}
