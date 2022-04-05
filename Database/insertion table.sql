SET IDENTITY_INSERT Notified_Person ON;
INSERT INTO Notified_Person(id) VALUES (4),(5),(6),(7),(8),(9),(10),(11),(12),(13)
SET IDENTITY_INSERT Notified_Person OFF;

--Users

INSERT INTO [User] ([email],first_name,middle_name,last_name,birth_date,[password])
VALUES ('mk3066@gmail.com', 'Marwa', 'Khaled', 'Saleh', '1996-12-10', '123jhgh456')
,('ak800@hotmail.com', 'Ahmed', 'Khaled', 'Saleh', '1996-12-10', '4sdfg2132')
,('may987@gmail.com', 'Mohamed', 'Ahmed', 'Youssef', '1995-5-17', '123456')
,('mae3541@hotmail.com', 'Mina', 'Ayman', 'ElMasry', '1996-12-10', '879bvn546')
,('oas347631@gmail.com', 'Omar', 'Ahmed', 'Serag', '1999-7-20', '213tyuyu035')
,('bhm987@hotmail.com', 'Bassant', 'Hossam', 'Mahmoud', '1997-4-23', '02ksadc34598')
,('sas4581@gmail.com', 'Salma', 'Ayman', 'Saber', '2000-2-12', 'asdfdf023458')
,('ere0581@hotmail.com', 'Elena', 'Riad', 'Emad', '1994-6-10', '8795afsd46')
,('kmh5967@gmail.com', 'Karim', 'Mahmoud', 'Hafez', '1992-12-30', '5af4s6d')
,('aga5857@hotmail.com', 'Amr', 'Gamal', 'Adel', '1990-3-14', 'a21df1')
,('efk352441@gmail.com', 'Emad', 'Farid', 'Khaled', '1990-6-10', '8afsd02d')
,('mae3541@hotmail.com', 'Hana', 'Ali', 'Shawkat', '1996-12-11', '879546')
,('rws5461@gmail.com', 'Reem', 'Walid', 'Soliman', '1995-10-10', '87ewrds9546')

--Three Viewers

INSERT INTO Viewer (ID, working_place, working_place_type, working_place_description)
VALUES (1, 'Google', 'Office', 'Most popular search engine office')
,(2, 'Dusit Thani', 'Hotel', 'A Thai hotel')
,(3, 'ElEzaby', 'Pharmacy', 'Sells drugs')

--Five contributors, two authorized reviewer, and three content managers.

INSERT INTO Contributor
VALUES (4, 10, 'portfolio/link1.com' , 'Sculpting', 4)
,(5, 15, 'portfolio/link2.com' , 'Painting', 5)
,(6, 11, 'portfolio/link3.com' , 'Writing', 6)
,(7, 5, 'portfolio/link4.com' , 'Writing', 7)
,(8, 15, 'portfolio/link5.com' , 'Painting', 8)

insert into Staff VALUES('2017-9-5', 8, 1000, 8000, 56)
,('2011-8-6', 9, 2000, 18000, 78)
,('2013-4-4', 6, 1000, 6000, 43)
,('2014-4-2', 7, 2000, 14000, 45)
,('2015-4-1', 7, 1000, 7000, 89);

insert into Content_manager VALUES('logos');
insert into Content_manager VALUES('videos');
insert into Content_manager VALUES('illustrator');
insert into Reviewer default VALUES;
insert into Reviewer default VALUES;


INSERT INTO Message(sent_at,message_contributer_id, message_viewer_id, sender_type, read_at, [text],read_status)
VALUES ('2018-05-29 18:09:22',4,1,'Viewer','2018-05-29 19:56:45','I would like to request a new content','1')
,('2018-06-09 14:35:12',4,1,'Contributer','2018-06-09 16:45:40','Your request is accepted','1')
,('2018-06-29 15:04:29',4,2,'Viewer','2018-06-30 20:23:12','I would like to request a new content','1')
,('2018-07-23 13:34:31',4,2,'Contributer','2018-07-23 14:51:09','Your request is accepted','1')
,('2018-07-29 17:45:26',6,3,'Viewer','2018-07-23 19:51:34','I would like to request a new content','1')
,('2018-07-29 18:45:23',6,3,'Contributer','2018-07-29 19:56:45','Your request is accepted','1')
,('2018-08-24 09:35:56',6,2,'Viewer','2018-08-24 19:50:33','I would like to request a new content','1')
,('2018-08-24 11:25:13',6,2,'Contributer','2018-08-24 19:53:40','Your request is accepted','1')
,('2018-09-29 11:45:06',6,1,'Viewer','2018-09-29 11:50:30','I would like to request a new content','1')
,('2018-09-29 12:40:23',6,1,'Contributer','2018-09-29 12:56:49','Your request is accepted','1')
,('2018-09-30 17:00:26',7,1,'Viewer','2018-09-30 19:00:34','I would like to request a new content','1')
,('2018-09-30 18:45:23',7,1,'Contributer','2018-07-29 19:56:45','Your request is accepted','1')
,('2018-10-24 09:35:56',6,2,'Viewer','2018-10-24 09:50:00','I would like to request a new content','1')
,('2018-10-24 09:57:13',6,2,'Contributer','2018-10-24 19:59:40','Your request is accepted','1')
,('2018-11-03 11:00:06',6,1,'Viewer','2018-11-03 11:50:30','I would like to request a new content','1')
,('2018-11-03 12:00:23',6,1,'Contributer','2018-11-03 12:51:49','Your request is accepted','1')
,('2018-11-03 12:00:06',8,1,'Viewer','2018-11-03 12:50:30','I would like to request a new content','1')
,('2018-11-03 13:00:23',8,1,'Contributer','2018-11-03 12:51:49','Your request is accepted','1')

INSERT INTO Category (Category.[type],Category.[description])
VALUES ('Education','All you need to know about the history of Egypt and its culture'),
 ('Art','The best art pieces made in the land of the pharaohs'),
('Tourism','Tourism in Egypt');

INSERT INTO Sub_Category VALUES('Education','History'),('Education','Culture'),
('Art','Artworks'),('Art','Sculptures'),('Tourism','Medical'),('Tourism','Archaeological');

INSERT INTO Content_type VALUES ('logos'),(videos),(illustrator);

SET IDENTITY_INSERT Notification_Object ON
INSERT INTO Notification_Object(id) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13);
SET IDENTITY_INSERT Notification_Object OFF;

INSERT INTO Existing_Request VALUES (1,2),(2,3);

INSERT INTO New_Request
VALUES ('1','New Content','First new content information',1,1,4,CURRENT_TIMESTAMP),('1','New Content','Second new content information',2,2,4,CURRENT_TIMESTAMP),('1','New Content','Third new content information',3,3,6,CURRENT_TIMESTAMP),('1','New Content','Forth new content information',2,4,6,CURRENT_TIMESTAMP),('1','New Content','Fifth new content information',1,5,6,CURRENT_TIMESTAMP)

INSERT INTO New_Request(accept_status,new_request_viewer_id, new_request_notif_obj_id,new_request_contributer_id,Requesting_time)
VALUES ('1',1,8,8,CURRENT_TIMESTAMP),('1',2,7,6,CURRENT_TIMESTAMP),('1',1,8,8,CURRENT_TIMESTAMP)

INSERT INTO New_Request
VALUES (null,'New Content','Sixth new content information',1,9,null,CURRENT_TIMESTAMP),(null,'New Content','Seventh new content information',1,10,null,CURRENT_TIMESTAMP),(null,'New Content','Eighth new content information',1,11,null,CURRENT_TIMESTAMP);


INSERT INTO Content ( Content.link, Content.uploaded_at, Content.content_contributer_id, Content.content_category_type, Content.content_subcategory_name ,Content.[content_type]) values('Content1/link','2017-11-03 16:34:44',4,'Education','History','logos')
,('Content2/link','2017-11-04 17:34:44',5,'Education','History','videos')
,('Content3/link','2017-11-05 18:34:44',8,'Tourism','Medical','illustrator')
,('Content4/link','2017-11-06 19:34:44',6,'Tourism','Archaeological','videos')
,('Content5/link','2017-11-07 11:34:44',7,'Art','Sculptures','logos')
,('Content6/link','2017-11-08 12:34:44',4,'Art','Artworks','illustrator')
,('Content7/link','2017-11-09 13:34:44',8,'Art','Sculptures','logos')
,('Content8/link','2017-11-10 14:34:44',6,'Education','History','logos')
,('Content9/link','2017-11-11 16:34:44',4,'Education','Culture','logos')


INSERT INTO Original_Content
VALUES(1,11,9,'1','1',4.2),
(2,12,10,'1','1',3.5),
(3,13,9,1,1,2.3)

INSERT INTO New_Content VALUES (4,1),(5,2),(6,3),(7,4),(8,5),(9,6);


INSERT INTO [Event] 
VALUES ('A trip to the Egyptian Museum' ,'15 Meret Basha, Ismailia, Qasr an Nile' , 'Cairo' , '2018-12-12 13:00:00' , 'Ahmed Hossam' , 12 , 2 ),('A trip to the Pyramids' , 'Al Haram, Nazlet El-Semman, Al Haram' , 'Giza' , '2018-12-14 13:00:00' , 'Ahmed Hossam' , 13 , 3 );


INSERT INTO Advertisement
VALUES('A trip to the Egyptian Museum','15 Meret Basha, Ismailia, Qasr an Nile,Cairo',1,2),('A trip to the Pyramids','Al Haram, Nazlet El-Semman, Al Haram,Giza',2,3);

insert into Announcement (sent_at,seen_at,Announcement_notified_person_id,Announcement_notification_object_id)
values(CURRENT_TIMESTAMP,Null,4,12),
(CURRENT_TIMESTAMP,Null,4,12),
(CURRENT_TIMESTAMP,Null,5,12),
(CURRENT_TIMESTAMP,Null,6,12),
(CURRENT_TIMESTAMP,Null,7,12),
(CURRENT_TIMESTAMP,Null,8,12),
(CURRENT_TIMESTAMP,Null,9,12),
(CURRENT_TIMESTAMP,Null,10,12),
(CURRENT_TIMESTAMP,Null,11,12),
(CURRENT_TIMESTAMP,Null,12,12),
(CURRENT_TIMESTAMP,Null,13,12),
(CURRENT_TIMESTAMP,Null,4,13),
(CURRENT_TIMESTAMP,Null,5,13),
(CURRENT_TIMESTAMP,Null,6,13),
(CURRENT_TIMESTAMP,Null,7,13),
(CURRENT_TIMESTAMP,Null,8,13),
(CURRENT_TIMESTAMP,Null,9,13),
(CURRENT_TIMESTAMP,Null,10,13),
(CURRENT_TIMESTAMP,Null,11,13),
(CURRENT_TIMESTAMP,Null,12,13),
(CURRENT_TIMESTAMP,Null,13,13)

insert into Announcement (sent_at,seen_at,Announcement_notified_person_id,Announcement_notification_object_id)
values(CURRENT_TIMESTAMP,Null,4,1),
(CURRENT_TIMESTAMP,Null,4,2),
(CURRENT_TIMESTAMP,Null,6,3),
(CURRENT_TIMESTAMP,Null,6,4),
(CURRENT_TIMESTAMP,Null,6,5),
(CURRENT_TIMESTAMP,Null,8,6),
(CURRENT_TIMESTAMP,Null,6,7),
(CURRENT_TIMESTAMP,Null,8,8)


