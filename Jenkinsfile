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
    credentialsId: 'github-token-cred',

    // ── Deploy / GitOps (required when enableUpdateValuesYaml=true) ───
    organization         : 'devseccops',
    organizationManifests: '',
    valuesFile           : 'simple-react/values.yaml',
    configBranch         : 'dev',
    gitUsername          : '',
    gitEmail             : '',
    enableUpdateValuesYaml: false,

    // ── Build type ────────────────────────────────────────────────────
    buildType   : 'js',
    buildVersion: '18',

    // ── Feature flags ─────────────────────────────────────────────────
    enableBuild    : true,
    enableDeploy   : false,
    enableUnitTests: true,
    enableOwasp    : true,
    enableSonarQube: true,
)