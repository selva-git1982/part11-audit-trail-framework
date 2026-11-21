-- Sample inspection-oriented queries

-- Recent activity for a specific resource
SELECT event_time, user_identity, action, details
FROM audit_events
WHERE resource_id = 'example-resource-id'
  AND year = '2026' AND month = '11'
ORDER BY event_time DESC
LIMIT 100;

-- Count of events by action in a date range
SELECT action, COUNT(*) AS event_count
FROM audit_events
WHERE year = '2026' AND month = '11'
GROUP BY action
ORDER BY event_count DESC;

-- Events by a specific user
SELECT event_time, action, resource_id
FROM audit_events
WHERE user_identity = 'example-user'
  AND year = '2026'
ORDER BY event_time;
