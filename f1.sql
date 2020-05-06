create trigger JelszoKarbantartas
on Vevo
for update, insert
as

update Vevo 
set JelszoLejarat = dateadd(year, 1, CURRENT_TIMESTAMP)
from Vevo v
inner join inserted i on i.ID = v.ID
left outer join deleted d on d.ID = v.ID
where d.Jelszo != i.Jelszo or d.Jelszo IS NULL
