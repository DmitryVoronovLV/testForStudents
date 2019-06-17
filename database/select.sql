-- select * from answer_history ah
-- join user u on ah.uid = u.id
-- join answers a on ah.aid = a
-- join questions q on q.id = a.qid
-- join tests t on t.od = q.tid

-- select * from answers a
-- join questions q on a.qid = q.id
-- join tests t on q.tid = t.id