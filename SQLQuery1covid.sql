
select *
from Portfolio_project..covid_death
order by 3,4

--Selecting_data

select location, date, total_cases, new_cases, total_deaths, population
from Portfolio_project..covid_death
order by 1,2

--DeathPerentage
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from Portfolio_project..covid_death
order by 1,2


--Infected_Rate

select location, date, total_cases, population, (total_cases/population)*100 as Infected_Rate
from Portfolio_project..covid_death
order by 1,2

--Countries with highest infection rate

select location, population, MAX(total_cases) as Highest_Infected_Count, MAX((total_cases/population))*100 as Infected_Rate 
from Portfolio_project..covid_death

group by location, population
order by Infected_Rate desc

--Countries with Highest Death Rate as per total_cases
select location, max(total_deaths/total_cases)*100 as DeathPercentage
from Portfolio_project..covid_death
group by location
order by DeathPercentage desc

--Continent with highest death count

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount

from Portfolio_project..covid_death
where continent is not null
group by continent
order by TotalDeathCount desc


--Global Death Percentage
select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
from Portfolio_project..covid_death
where continent is not null
order by 1,2


--Joining Covid_death table with Covid_Vaccination table

select*
from Portfolio_project..covid_death dea
join Portfolio_project..covid_vaccination vac
     on dea.location = vac.location
	 and dea.date = vac.date


Create View ContinenthighestdeathRate_ as
select continent, MAX(cast(total_deaths as int)) as TotalDeathCount

from Portfolio_project..covid_death
where continent is not null
group by continent








