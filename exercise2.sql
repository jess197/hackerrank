/* Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score.
 If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

table hackers - hacker_id and name
table difficulty - difficulty_level and score
table challenges - challenge_id, hacker_id and difficulty_level 
table submissions - submission_id, hacker_id, challenge_id and score*/

set serveroutput on; 
SELECT h.hacker_id
     , h.name
    FROM submissions s
    JOIN challenges c ON s.challenge_id = c.challenge_id
    JOIN difficulty d ON c.difficulty_level = d.difficulty_level 
    JOIN hackers h ON s.hacker_id = h.hacker_id
    WHERE s.score = d.score 
      AND c.difficulty_level = d.difficulty_level
    GROUP BY h.hacker_id, h.name, s.hacker_id
    HAVING COUNT(s.hacker_id) >= 2
    ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC