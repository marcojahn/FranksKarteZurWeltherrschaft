MATCH (n) DETACH DELETE n;

// GOALS
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_goals.csv" AS csvLine
fieldterminator ','

MERGE (goal:Goal {name: csvLine.label, story: csvLine.story});

// Cluster
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_cluster.csv" AS csvLine
fieldterminator ','

MERGE (cluster:Cluster {name: csvLine.label, story: csvLine.story});

// buzzwords
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/marcojahn/FranksKarteZurWeltherrschaft/master/nodes_buzzword.csv" AS csvLine
fieldterminator ','

MERGE (buzzword:Buzzword {name: csvLine.label, story: csvLine.story});
CREATE (csvLine.cluster)-[:HAS_BUZZWORD]->(buzzword);