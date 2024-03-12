--DESCRIPTION:
--Your task is to add up letters to one letter.
--
--In SQL, you will be given a table letters, with a string column letter. Return the sum of the letters in a column letter.
--
--Notes:
--Letters will always be lowercase.
--Letters can overflow (see second to last example of the description)
--If no letters are given, the function should return 'z'
--Examples:
--table(letter: ["a", "b", "c"]) = "f"
--table(letter: ["a", "b"]) = "c"
--table(letter: ["z"]) = "z"
--table(letter: ["z", "a"]) = "a"
--table(letter: ["y", "c", "b"]) = "d" -- notice the letters overflowing
--table(letter: []) = "z"

-- Solution

select
case
    when sum(ascii(letter)-96)%26 = 0 then 'z'
    when sum(ascii(letter)-96) > 26 then chr(cast(sum(ascii(letter)-96)%26 as int)+96)
    when sum(ascii(letter)-96) <= 26 then chr(cast(sum(ascii(letter)-96) as int)+96)
    else 'z'
end as letter
from letters;