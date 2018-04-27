MATCH (n) DETACH DELETE n;

// GOALS
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_goals.csv" AS csvLine
fieldterminator ','

MERGE (goal:Goal {name: csvLine.label, story: csvLine.story})

// Cluster
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_cluster.csv" AS csvLine
fieldterminator ','

MERGE (cluster:Cluster {name: csvLine.label, story: csvLine.story})

// buzzwords
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_buzzword.csv" AS csvLine
fieldterminator ','

MERGE (buzzword:Buzzword {name: csvLine.label, story: csvLine.story})

// link cluster to buzzword
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_buzzword.csv" AS csvLine
fieldterminator ','

MATCH (cluster:Cluster { name: csvLine.cluster }), (buzzword:Buzzword {name: csvLine.label})
CREATE UNIQUE (cluster)-[:has_buzzword]->(buzzword)

// link goal belongs_to goal
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/edges_goal_belongs_to_goal.csv" AS csvLine
fieldterminator ','

MATCH (source:Goal { name: csvLine.source }), (target:Goal {name: csvLine.target})
CREATE (source)-[:]->(target)

// link buzzwords depends_on buzzword
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/edges_buzzword_depdends_on_buzzword.csv" AS csvLine
fieldterminator ','

MATCH (source:Buzzword { name: csvLine.source }), (target:Buzzword {name: csvLine.target})
CREATE UNIQUE (source)-[:depends_on]->(target)

// link buzzwords improves goal
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/edges_buzzword_improves_goal.csv" AS csvLine
fieldterminator ','

MATCH (source:Buzzword { name: csvLine.source }), (target:Goal {name: csvLine.target})
CREATE UNIQUE (source)-[:improves]->(target)
