use machine

select 
--tbl.uid,tbl.UInfo,count(*),(iif(tbl.QstAnswer=isnull(tbl.ansText,''),1,0) ) 
uid,UInfo,ExamID,count(*) AS TotQuestion,sum( iif(isnull(QstAnswer,'A')=isnull(ansText,'B'),1,0)) AS TotCorrect,count(*)-sum( iif(isnull(QstAnswer,'A')=isnull(ansText,'B'),1,0)) AS TotFalse ,cast(( sum( iif(isnull(QstAnswer,'A')=isnull(ansText,'B'),1,0))*100.0/count(*)) as float) as Percentage
from
(
select * from tbluser Left outer Join 
 tblWorkGroup on wguid=UID inner Join tblExam on WgExamID=ExamID 

 )tbl
 Left outer  join tblQuestion on qstExamID=Examid
 Left outer  join tblanswer on ansqstID=qstid and ansuid=UID

 group by  uid,UInfo,ExamID
 