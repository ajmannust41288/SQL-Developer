select COUNT(carnumber) as carnumcount ,color
from dbo.cars
group by color
having COUNT(carnumber)<=15;