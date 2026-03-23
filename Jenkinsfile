 @Library('devseccops-shared-library@main') _                                                                                                                                 
                                                                                                                                                                               
  deploymentPipeline(                                                                                                                                                          
      // ── Core (required) ───────────────────────────────────────────────                                                                                                    
      codeRepoUrl  : 'https://github.com/manpreetsinghdevseccops/simple-react.git',                                                                                                     
      branchName   : 'main',                                                                                                                                                   
      imageName    : 'simple-react',                                                                                                                                       
      ecrName      : 'simple-react',                                                                                                                                       
      serviceName  : 'simple-react',                                                                                                                                       
      awsAccount   : '130705418859',                                                                                                                                           
      awsRegion    : 'ap-south-1',                                                                                                                                             
      credentialsId: 'github-token',                                                                                                                                           
                                                                                                                                                                               
      // ── Deploy / GitOps (required when enableUpdateValuesYaml=true) ───                                                                                                    
      organization         : 'devseccops',           // ← FIXED typo (was orgranization)                                                                                       
      organizationManifests: 'devseccops-service-configs',                                                                                                                     
      valuesFile           : 'simple-react/values.yaml',                                                                                                                       
      configBranch         : 'dev',                                                                                                                                            
      gitUsername          : 'manpreetsinghdevseccops',                                                                                                                        
      gitEmail             : 'manpreet@devseccops.ai',                                                                                                                         
      enableUpdateValuesYaml: true,                                                                                                                                            
                                                                                                                                                                               
      // ── Build type ────────────────────────────────────────────────────                                                                                                    
      buildType   : 'js',                                                                                                                                                      
      buildVersion: '18',     // ← verify this tag exists: golang:1.22-alpine on Docker Hub                                                                                  
                                 //   '1.25.4' does not exist yet as a Docker image tag                                                                                        
                                                                                                                                                                               
      // ── Feature flags ─────────────────────────────────────────────────  
      enableBuild    : false,     
      enableDeploy   : false,     
      enableUnitTests: true,    
      enableOwasp    : false,   
      enableSonarQube: true,                                                                                                                                                   
  )        
