SELECT TOP (1000) [Vegetable]
      ,[Form]
      ,[RetailPrice]
      ,[RetailPriceUnit]
      ,[Yield]
      ,[CupEquivalentSize]
      ,[CupEquivalentUnit]
      ,[CupEquivalentPrice]
  FROM [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022]

select top 5 [Vegetable],Max(RetailPrice) as 'Max_Rp_2022',Min(RetailPrice) as 'Min_Rp_2022',count(*) as 'Total_Count'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022] 
--FULL OUTER JOIN [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] b on a.Form=b.Form
GROUP BY Vegetable

select top 5 [Vegetable],Max(RetailPrice) as 'Max_Rp_2020',Min(RetailPrice) as 'Min_Rp_2020',count(*) as 'Total_Count'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] 
--FULL OUTER JOIN [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] b on a.Form=b.Form
GROUP BY Vegetable

select Form,Max(RetailPrice) as 'Max_Rp_2022',Min(RetailPrice) as 'Min_Rp_2022',Max(CupEquivalentPrice) as 'CEP_Max',Min(CupEquivalentPrice) as 'CEP_Min'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022] 
group by Form

select Form,Max(RetailPrice) as 'Rp_2020',Min(RetailPrice) as 'rp_2020',Max(CupEquivalentPrice) as 'CEP_Max',Min(CupEquivalentPrice) as 'CEP_Min'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] 
group by Form

select a.Form,Avg(a.RetailPrice) as 'Avg_Rp_2020',Avg(a.CupEquivalentPrice) as 'Avg_CEP_2020',Avg(b.RetailPrice) as 'Avg_Rp_2022',Avg(b.CupEquivalentPrice) as 'Avg_CEP_2022'  
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] a
INNER JOIN [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022] b on a.Vegetable=b.Vegetable
group by a.Form


-- which form of food Reilprice have been increased the most in past 2 years from 2020 
select b.Form,Max(b.RetailPrice)-Max(a.RetailPrice) as 'Rp_Diff',Max(b.CupEquivalentPrice)-Max(a.CupEquivalentPrice) as 'CEP_Diff'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022]  b
INNER JOIN [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] a on a.Vegetable=b.Vegetable
group by b.Form

select b.Form,Max(a.RetailPrice)-Max(b.RetailPrice) as 'Rp_Diff',Max(a.CupEquivalentPrice)-Max(b.CupEquivalentPrice) as 'CEP_Diff'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Fruit_2020]  b
INNER JOIN [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Fruit_Prices_2022] a on a.Fruit=b.Fruit
group by b.Form 

select Form,Max(RetailPrice) as 'Max_Rp_2022',Min(RetailPrice) as 'Min_Rp_2022',Max(CupEquivalentPrice) as 'CEP_Max',Min(CupEquivalentPrice) as 'CEP_Min'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022] 
group by Form

select Form,Max(RetailPrice) as 'Max_Rp_2020',Min(RetailPrice) as 'Min_Rp_2020',Max(CupEquivalentPrice) as 'CEP_Max',Min(CupEquivalentPrice) as 'CEP_Min'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] 
group by Form

select a.Form,Max(a.RetailPrice) as 'Max_Rp_2020',Max(a.CupEquivalentPrice) as 'CEP_Max_2020',Max(b.RetailPrice) as 'Max_Rp_2022',Max(b.CupEquivalentPrice) as 'CEP_Max_2022',
Max(a.RetailPrice)/Max(b.RetailPrice)*100 as 'rp%',Max(a.CupEquivalentPrice)/Max(b.CupEquivalentPrice)*100 as 'CEP%'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] a 
inner join [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022]  b on a.Vegetable=b.Vegetable
group by a.Form

select a.Vegetable,Avg(a.RetailPrice)/Avg(b.RetailPrice)*100 as 'Rp%_diff',Avg(a.CupEquivalentPrice)/Avg(b.CupEquivalentPrice)*100 as 'CEP%_diff'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Veggie_2020] a 
full outer join [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Vegetable_Prices_2022]  b on a.Form=b.Form
group by a.Vegetable

select a.Fruit,Avg(a.RetailPrice)/Avg(b.RetailPrice)*100 as 'Rp%_diff',Avg(a.CupEquivalentPrice)/Avg(b.CupEquivalentPrice)*100 as 'CEP%_diff'
from [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Fruit_2020] a 
full outer join [USA_Food_Inflation_Analysis 2020-2022].[dbo].[Fruit_Prices_2022]  b on a.Form=b.Form
group by a.Fruit


