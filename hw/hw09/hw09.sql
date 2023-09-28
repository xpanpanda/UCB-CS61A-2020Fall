CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name AS name,s.size AS size FROM dogs AS d, sizes AS s
  WHERE d.height>s.min AND d.height<=s.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT pc.child FROM parents AS pc,dogs AS s
  WHERE pc.parent=s.name
  ORDER BY -s.height;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT d1.child AS first,d2.child AS second, s1.size AS size  FROM parents AS d1,parents AS d2,size_of_dogs AS s1,size_of_dogs AS s2
  WHERE d1.child<d2.child AND d1.parent=d2.parent AND s1.name=d1.child AND s2.name=d2.child AND s1.size=s2.size;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT  'The two siblings, ' || first || ' plus ' || second || ' have the same size: ' || size FROM siblings;

