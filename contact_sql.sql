SELECT 
    c.first_name || ' ' || c.last_name AS "Full Name",
    c.email AS "Email Address",
    n.note_text AS "Most Recent Note text"
FROM contacts c
JOIN contact_notes n ON c.id = n.contact_id
WHERE c.first_name LIKE 'A%'
  AND n.created_at >= DATE('now', '-7 days')
  AND n.note_id = (
      SELECT MAX(n2.note_id) 
      FROM contact_notes n2 
      WHERE n2.contact_id = c.id
  );
