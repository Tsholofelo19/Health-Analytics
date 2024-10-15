--select *
--from [Health Dept].dbo.ocd_patient_dataset

-- Count the Percentage of Female & Male that have OCD 
-- & Average Obsession Score by Gender


with data as (
select gender, count (Patient_ID) as Patient_Count,
       avg (convert(int,Y_Bocs_Score_Obsessions)) as Avg_Obs_Score

from [Health Dept].dbo.ocd_patient_dataset
group By Gender
-- order by 2
)

select 
sum(case when Gender = 'female' then patient_count else 0 end) 
as count_female,
sum(case when Gender = 'male' then patient_count else 0 end) 
as count_male,

round(sum(case when Gender = 'female' then patient_count else 0 end)/
(sum(case when Gender = 'female' then patient_count else 0 end)+sum(case when Gender = 'male' then patient_count else 0 end)) *100,2)
as percentage_female,

round(sum(case when Gender = 'male' then patient_count else 0 end)/
(sum(case when Gender = 'female' then patient_count else 0 end)+sum(case when Gender = 'male' then patient_count else 0 end)) *100,2)
as percentage_male

from data

-- Count of Patients by Ethnicity and their Respective Average Obsession Score

select ethnicity, count(Patient_ID) Patient_Count,
       avg(convert(int,Y_Bocs_Score_Obsessions)) As obs_score
from [Health Dept].dbo.ocd_patient_dataset
group by Ethnicity

-- Number of People diagnosed with OCD MoM

select
OCD_Diagnosis_Date,
count(Patient_ID) patient_count
from [Health Dept].dbo.ocd_patient_dataset
group by OCD_Diagnosis_Date
order by 1

-- What is the most commom Compulsion type (Count) & it's respective AVG Obsession Score

select obsession_Type, count (Patient_ID) as patient_count,
      avg(convert(int,Y_BOCS_SCORe_OBSESSIONS)) as obs_score
from [Health Dept].dbo.ocd_patient_dataset
group by obsession_Type
order by 2

-- What is the most common Compulsion type (Count) & it's respective Average Obsession Score

select Compulsion_Type, count (Patient_ID) as patient_count,
      avg(convert(int,Y_BOCS_SCORe_OBSESSIONS)) as obs_score
from [Health Dept].dbo.ocd_patient_dataset
group by Compulsion_Type
order by 2
