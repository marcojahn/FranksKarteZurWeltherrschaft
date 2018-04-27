CREATE
  (BusinessValue:Root {name: 'Business Value'}),
  (Feedback:Target {name:'Feedback'}),
  (ContinuousImprovement:Target {name:'Continuous Improvement'}),
  (CycleTime:Target {name:'Cycle Time'}),
  (Availability:Target {name:'Availability'}),

  (Feedback)-[:belongs_to]->(BusinessValue),
  (ContinuousImprovement)-[:belongs_to]->(BusinessValue),
  (CycleTime)-[:belongs_to]->(BusinessValue),
  (Availability)-[:belongs_to]->(BusinessValue),

// Cluster Lean Enterprise
  (LeanEnterprise:Cluster {name:'Lean Enterprise'}),
  (BeyondBudgeting:Buzzword {name:'Beyond Budgeting'}),
  (OutcomeDriven:Buzzword {name:'Outcome Driven'}),
  (CraftsmanshipMaster:Buzzword {name:'Craftsmanship & Mastery'}),

  (LeanEnterprise)-[:has_buzzword]->(BeyondBudgeting),
  (LeanEnterprise)-[:has_buzzword]->(OutcomeDriven),
  (LeanEnterprise)-[:has_buzzword]->(CraftsmanshipMaster),

  (BeyondBudgeting)-[:improves]->(CycleTime),

// Cluster Autonomous Teams
  (AutonomousTeams:Cluster {name:'Autonomous Teams'}),
  (FeatureFlow:Buzzword {name:'Feature Flow'}),
  (TShaped:Buzzword {name:'T-Shaped'}),
  (CrossFunctional:Buzzword {name:'Cross-functional'}),
  (AlignedOnBusinessCapabilities:Buzzword {name:'Aligned on Business Capabilities'}),

  (AutonomousTeams)-[:has_buzzword]->(FeatureFlow),
  (AutonomousTeams)-[:has_buzzword]->(TShaped),
  (AutonomousTeams)-[:has_buzzword]->(CrossFunctional),
  (AutonomousTeams)-[:has_buzzword]->(AlignedOnBusinessCapabilities),

  (CrossFunctional)-[:improves]->(CycleTime),
  (CrossFunctional)-[:improves]->(Availability),

// Cluster Services
  (Services:Cluster {name:'Services'}),
  (LeanEAM:Buzzword {name:'Lean EAM'}),
  (SelfContainedSystems:Buzzword {name:'Self contained systems'}),

  (Services)-[:has_buzzword]->(LeanEAM),
  (Services)-[:has_buzzword]->(SelfContainedSystems),

  (SelfContainedSystems)-[:improves]->(CycleTime),
  (SelfContainedSystems)-[:improves]->(Availability),

// Cluster Automation
  (Automation:Cluster {name:'Automation'}),
  (Metrics:Buzzword {name:'Metrics & KPIs'}),
  (ContinuousDelivery:Buzzword {name:'Continuous Delivery'}),
  (InfrastructureAsCode:Buzzword {name:'Infrastructure as code'}),
  (ApplicationPlatform:Buzzword {name:'Application Platform'}),

  (Automation)-[:has_buzzword]->(Metrics),
  (Automation)-[:has_buzzword]->(ContinuousDelivery),
  (Automation)-[:has_buzzword]->(InfrastructureAsCode),
  (Automation)-[:has_buzzword]->(ApplicationPlatform),

  (Metrics)-[:improves]->(Feedback),
  (ContinuousDelivery)-[:improves]->(CycleTime),
  (InfrastructureAsCode)-[:improves]->(CycleTime),
  (InfrastructureAsCode)-[:improves]->(Availability),
  (ContinuousDelivery)-[:improves]->(Availability),
  (ApplicationPlatform)-[:improves]->(Availability),

// depends_on
  (SelfContainedSystems)-[:depends_on]->(ApplicationPlatform),
  (ApplicationPlatform)-[:depends_on]->(InfrastructureAsCode)

