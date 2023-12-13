select * from Absenteesim_at_work a
left join
compensations b
on a.id=b.id
left join reasons c
on a.reason_for_absence=c.Number


-----Healthiest  employees eligilble for Bonus------------

select * from Absenteesim_at_work
where social_drinker=0 and social_smoker=0
and body_mass_index<25  and
absenteeism_time_in_hours<(select avg(absenteeism_time_in_hours) from Absenteesim_at_work)


-----

select 
a.id,
c.reason,
a.month_of_absence,
a.body_mass_index,
case when a.body_mass_index<18.5 then 'Underweight'
     when a.body_mass_index between 18.5 and 24.9 then 'Healthy'
	 when a.body_mass_index between 25 and 30 then 'Overweight'
	 when a.body_mass_index>30 then 'Obese'
	 else 'Unknown' end as BMI_Category,
a.seasons,
case when month_of_absence in(12,1,2) then 'Winter'
     when month_of_absence in(3,4,5) then 'Spring'
	 when month_of_absence in(6,7,8) then 'Summer'
	 when month_of_absence in(9,10,11) then 'Fall'
	 else 'Unknown' end Season_Names,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_per_day,
absenteeism_time_in_hours
from Absenteesim_at_work a
left join
compensations b
on a.id=b.id
left join reasons c
on a.reason_for_absence=c.Number order by 1



alter table reasons
Rename column  ID to Number

-----------------------Table creation-------------------------------------------------------

CREATE TABLE Absenteesim_at_work(
ID	int,
Reason_for_absence int,
Month_of_absence int,
Day_of_the_week int,
Seasons int,
Transportation_expense int,
Distance_from_Residence_to_Work int,
Service_time int,
Age int,
Work_load_Average_per_day varchar(10),
Hit_target int,
Disciplinary_failure int,
Education int,
Son int,
Social_drinker int,
Social_smoker int,
Pet int,
Weight int,
Height int,
Body_mass_index int,
Absenteeism_time_in_hours int
);


COPY Absenteesim_at_work
FROM 'C:\Users\Dell\Documents\2023\Data analysis projects\Project-7\Dataset\Absenteeism_at_work-1\Absenteeism_at_work.csv'
CSV HEADER;


CREATE TABLE Reasons(
ID	int,
Reason text
);


COPY Reasons
FROM 'C:\Users\Dell\Documents\2023\Data analysis projects\Project-7\Dataset\Absenteeism_at_work-1\Reasons.csv'
CSV HEADER;


CREATE TABLE Compensations(
ID	int,
comp_per_hr int
);

COPY Compensations
FROM 'C:\Users\Dell\Documents\2023\Data analysis projects\Project-7\Dataset\Absenteeism_at_work-1\compensation.csv'
CSV HEADER;
