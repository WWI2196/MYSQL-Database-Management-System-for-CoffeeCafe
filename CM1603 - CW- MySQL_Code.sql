create database Coffeecafe_details;

use Coffeecafe_details;
CREATE TABLE employee (
    employee_ID INT(4) UNIQUE NOT NULL,
    designation VARCHAR(20) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(8 , 2 ) NOT NULL,
    manager_ID INT(4),
    CONSTRAINT e_eID_pk PRIMARY KEY (employee_ID),
    CONSTRAINT e_mID_fk FOREIGN KEY (manager_ID)
        REFERENCES employee (employee_ID)
);

CREATE TABLE employee_address (
    employee_ID INT(4) NOT NULL,
    address VARCHAR(80) NOT NULL,
    CONSTRAINT ead_eID_ad_pk PRIMARY KEY (employee_ID , address),
    CONSTRAINT ead_eID_fk FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
);

CREATE TABLE employee_contact_number (
    employee_ID INT(4) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    CONSTRAINT ecn_eID_cn_pk PRIMARY KEY (employee_ID , contact_number),
    CONSTRAINT ecn_eID_fk FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
);
  
CREATE TABLE delivery (
    delivery_ID INT(6) UNIQUE NOT NULL,
    vehicle_number VARCHAR(8) NOT NULL,
    delivery_date DATE NOT NULL,
    driver_ID INT(4) NOT NULL,
    steward_ID INT(4) NOT NULL,
    delivered_time TIME NOT NULL,
    CONSTRAINT d_diID_pk PRIMARY KEY (delivery_ID),
    CONSTRAINT d_drID_fk FOREIGN KEY (driver_ID)
        REFERENCES employee (employee_ID),
    CONSTRAINT d_stID_fk FOREIGN KEY (steward_ID)
        REFERENCES employee (employee_ID)
);
    
CREATE TABLE customer (
    user_ID VARCHAR(6) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    delivery_address VARCHAR(80) NOT NULL,
    CONSTRAINT c_uID_pk PRIMARY KEY (user_ID)
);

CREATE TABLE customer_contact_number (
    user_ID VARCHAR(6) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    CONSTRAINT ccn_uID_cn_pk PRIMARY KEY (user_ID , contact_number),
    CONSTRAINT ccn_uID_fk FOREIGN KEY (user_ID)
        REFERENCES customer (user_ID)
);
    
CREATE TABLE product (
    product_ID VARCHAR(10) UNIQUE NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    product_description VARCHAR(200) NOT NULL DEFAULT '(yet to update)',
    product_type VARCHAR(20) NOT NULL,
    price DECIMAL(8 , 2 ) NOT NULL,
    CONSTRAINT p_pID_pk PRIMARY KEY (product_ID)
);
    
CREATE TABLE delivery_receive (
    delivery_ID INT(6) NOT NULL,
    user_ID VARCHAR(6) NOT NULL,
    CONSTRAINT dr_diID_uID_pk PRIMARY KEY (delivery_ID , user_ID),
    CONSTRAINT dr_diID_fk FOREIGN KEY (delivery_ID)
        REFERENCES delivery (delivery_ID),
    CONSTRAINT dr_uID_fk FOREIGN KEY (user_ID)
        REFERENCES customer (user_ID)
);

CREATE TABLE user_card_details (
    card_number VARCHAR(16) UNIQUE NOT NULL,
    card_holder VARCHAR(50) NOT NULL,
    CONSTRAINT ucd_cdn_pk PRIMARY KEY (card_number)
);

CREATE TABLE order_details (
    order_ID VARCHAR(10) UNIQUE NOT NULL,
    received_date DATE NOT NULL,
    received_time TIME NOT NULL DEFAULT '00:00:00',
    prepaired_time TIME NOT NULL DEFAULT '00:00:00',
    delivery_ID INT(6) NOT NULL,
    prepared_employee_ID INT(4) NOT NULL,
    user_ID VARCHAR(6) NOT NULL,
    payment_ID VARCHAR(10) UNIQUE NOT NULL,
    CONSTRAINT od_oID_pk PRIMARY KEY (order_ID),
    CONSTRAINT od_diID_fk FOREIGN KEY (delivery_ID)
        REFERENCES delivery (delivery_ID),
    CONSTRAINT od_preID_fk FOREIGN KEY (prepared_employee_ID)
        REFERENCES employee (employee_ID),
    CONSTRAINT od_uID_fk FOREIGN KEY (user_ID)
        REFERENCES customer (user_ID)
);
    
CREATE TABLE order_contents (
    order_ID VARCHAR(10) NOT NULL,
    product_ID VARCHAR(10) NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    CONSTRAINT oc_oID_pID_pk PRIMARY KEY (order_ID,product_ID),
    CONSTRAINT oc_oID_fk FOREIGN KEY (order_ID)
        REFERENCES order_details (order_ID),
    CONSTRAINT oc_pID_fk FOREIGN KEY (product_ID)
        REFERENCES product (product_ID)
);

CREATE TABLE payment_online (
    payment_ID VARCHAR(10) UNIQUE NOT NULL,
    payment_date DATE NOT NULL,
    total DECIMAL(8 , 2 ) NOT NULL,
    verified_time TIME NOT NULL,
    steward_ID INT(4) NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    CONSTRAINT po_pID_pk PRIMARY KEY (payment_ID),
    CONSTRAINT po_stID_fk FOREIGN KEY (steward_ID)
        REFERENCES employee (employee_ID),
	CONSTRAINT po_cdn_fk FOREIGN KEY (card_number)
        REFERENCES user_card_details (card_number),
	CONSTRAINT po_pID_fk FOREIGN KEY (payment_ID)
        REFERENCES order_details (payment_ID)
);

CREATE TABLE payment_on_delivery (
    payment_ID VARCHAR(10) UNIQUE NOT NULL,
    payment_date DATE NOT NULL,
    total DECIMAL(8 , 2 ) NOT NULL,
    verified_time TIME NOT NULL,
    steward_ID INT(4) NOT NULL,
    receipt_number VARCHAR(10) NOT NULL,
    CONSTRAINT pod_pID_pk PRIMARY KEY (payment_ID),
    CONSTRAINT pod_stID_fk FOREIGN KEY (steward_ID)
        REFERENCES employee (employee_ID),
	CONSTRAINT pod_pID_fk FOREIGN KEY (payment_ID)
        REFERENCES order_details (payment_ID)
);

CREATE TABLE delivery_staff (
    employee_ID INT(4) UNIQUE NOT NULL,
    driver_license_number VARCHAR(15) UNIQUE NOT NULL,
    CONSTRAINT ds_drID_pk PRIMARY KEY (employee_ID),
    CONSTRAINT ds_drID_fk FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
);
    
CREATE TABLE delivery_vehicles_allowed (
    employee_ID INT(4) NOT NULL,
    vehicles_allowed VARCHAR(10) NOT NULL,
    CONSTRAINT dv_drID_drv_pk PRIMARY KEY (employee_ID , vehicles_allowed),
    CONSTRAINT dv_drID_fk FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
);

CREATE TABLE steward_details (
    employee_ID INT(4) UNIQUE NOT NULL,
    city_assigned VARCHAR(20) NOT NULL,
    CONSTRAINT st_eID_pk PRIMARY KEY (employee_ID),
    CONSTRAINT st_eID_fk FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
);

CREATE TABLE manager_details (
    employee_ID INT(4) UNIQUE NOT NULL,
    employment_peroid_years INT DEFAULT '1',
    division_in_charge VARCHAR(30) UNIQUE NOT NULL,
    CONSTRAINT md_eID_pk PRIMARY KEY (employee_ID),
    CONSTRAINT md_eID_fk FOREIGN KEY (employee_ID)
        REFERENCES employee (employee_ID)
);
