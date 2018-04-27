// (1) fetch node with name 'Infrastructure as code' as starting point
MATCH (n:Buzzword {name: 'Infrastructure as code'}) RETURN n LIMIT 25

// (2) fetch buzzwords with direct depending on "Infrastructure as code"
MATCH
	(n:Buzzword {name: 'Infrastructure as code'}) <-[:depends_on]-(x:Buzzword)
RETURN n, x

// (3) fetch buzzwords with non-direct dependencies on "Infrastructure as code" (2 - 3)
MATCH
	(n:Buzzword {name: 'Infrastructure as code'}) <-[:depends_on*2..3]-(x:Buzzword)
RETURN n, x

// like (3) + Buzzword goal
MATCH
	(g:Goal)<-[:improves]-(n:Buzzword {name: 'Infrastructure as code'})<-[:depends_on]-(x:Buzzword)
RETURN n, x, g

// like (4) + dependency goal
MATCH
	(g:Goal)<-[:improves]-(n:Buzzword {name: 'Infrastructure as code'})<-[:depends_on]-(x:Buzzword)
WITH g, n, x
OPTIONAL MATCH (x)-[:improves]->(xg:Goal)
RETURN n, x, g, xg

// relationsships between clusters
MATCH
	(c:Cluster)-[:has_buzzword]->(b:Buzzword)<-[:has_buzzword]-(xc:Cluster)
RETURN c, b, xc