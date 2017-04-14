SELECT studentA.name, studentA.grade, studentB.name, studentB.grade, studentC.name, studentC.grade
FROM student_like

JOIN student studentA
ON studentA.id = student_like.liker_id
JOIN student studentB
ON studentB.id = student_like.likee_id

JOIN friend friendA
ON (friendA.id1 = studentA.id) OR (friendA.id2 = studentA.id)
JOIN friend friendB
ON (friendB.id1 = studentB.id) OR (friendB.id2 = studentB.id)

JOIN student studentC
ON ((studentC.id = friendA.id1 OR studentC.id = friendA.id2) AND (studentC.id = friendB.id1 OR studentC.id = friendB.id2))


WHERE (SELECT friend.id1
	   FROM friend
	   WHERE (studentB.id = friend.id2
	     AND studentA.id = friend.id1) OR (studentB.id = friend.id1 AND studentA.id = friend.id2)) IS NULL;
