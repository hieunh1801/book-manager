create view member_borrow as (
	select m.id as member_id
	,SUM(case when b.status is not null then 1 else 0 end ) as total_borrow
	,SUM(case when b.status = 3 then 1 else 0 end ) as pay_borrow
	,SUM(case when b.status is not null  and b.status <> 3 then 1 else 0 end ) as not_pay_borrow
	from member m
	left join borrow b on m.id=b.member_id
	group by m.id 
)

