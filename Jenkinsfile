@Library('devseccops-shared-library@main') _

deploymentPipeline(
    // ── Core (required) ───────────────────────────────────────────────
    codeRepoUrl  : 'https://github.com/manpreetsinghdevseccops/simple-react',
    branchName   : 'main',
    imageName    : 'simple-react',
    ecrName      : 'simple-react',
    serviceName  : 'simple-react',
    awsAccount   : '130705418859',
    awsRegion    : 'ap-south-1',
    credentialsId: 'github-cred-token',

    // ── Deploy / GitOps (required when enableUpdateValuesYaml=true) ───
    organization         : 'devseccops',
    organizationManifests: 'devseccops-service-configs',
    valuesFile           : 'simple-react/values.yaml',
    configBranch         : 'dev',
    gitUsername          : 'manpreetsinghdevseccops',
    gitEmail             : 'manpreet@devseccops.ai',
    enableUpdateValuesYaml: true,

    // ── Build type ────────────────────────────────────────────────────
    buildType   : 'js',
    buildVersion: '16.14.0',

    // ── Feature flags ─────────────────────────────────────────────────
    enableBuild    : true,
    enableDeploy   : true,
    enableUnitTests: true,
    enableOwasp    : true,
    enableSonarQube: false,
)