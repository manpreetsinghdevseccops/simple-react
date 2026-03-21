@Library('devseccops-shared-library') _

deploymentPipeline(
    codeRepoUrl: 'https://github.com/manpreetsinghdevseccops/simple-react.git',
    branchName: 'main',
    imageName: 'simple-react',
    ecrName: 'simple-react',
    serviceName: 'simple-react',
    awsAccount: '130705418859',
    awsRegion: 'ap-south-1',
    credentialsId: 'github-token',

    orgranization: 'devseccops',
    organizationManifests: 'devseccops-service-configs',
    valuesFile: 'simple-react/values.yaml',
    configBranch: 'dev',

    gitUsername: 'manpreetsinghdevseccops',
    gitEmail: 'manpreet@devseccops.ai',
    enableUpdateValuesYaml: true,

    agentLabel: 'kaniko',

    // ── New: unit test params (opt-in, safe default = false) ──
    buildType: 'node',
    buildVersion: '18',
    testScript: 'test',
    enableUnitTests: false,
    enableOwasp: true,
)
