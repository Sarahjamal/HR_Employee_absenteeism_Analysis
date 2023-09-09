-- Join Table
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons c
on a.Reason_for_absence = c.Number

-- Healthiest Employees qualified for bonus
select * from Absenteeism_at_work 
where Social_drinker = 0 and Social_smoker = 0 
and Body_mass_index < 25 and 
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

-- Compensation rate increase for non-smokers /  budget $983,221 i.e $0.68 per hour, $1,414.4 per year
select COUNT(*) from Absenteeism_at_work
where Social_smoker = 0

-- Optimize this query
select 
a.ID,
c.Reason,
Month_of_absence,
Body_mass_index,
case when Body_mass_index < 18.5 then 'Under weight'
     when Body_mass_index between 18.5 and 25 then 'Healthy'
	 when Body_mass_index between 25 and 30 then 'Over weight'
	 when Body_mass_index > 30 then 'Obese'
	 else 'unknown' END as BMI_Category,
Case when Month_of_absence in (12,1,2) then 'Winter'
     when Month_of_absence in (3,4,5) then 'Spring'
	 when Month_of_absence in (6,7,8) then 'Summer'
	 when Month_of_absence in (9,10,11) then 'Autumn'
	 else 'unknown' END as Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons c
on a.Reason_for_absence = c.Number