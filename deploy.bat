@set /p VERSION= "What version to deploy?  "
@set /p TARGET= "What stack to target?  "
@set /p COLOR= "What color to deploy?  "

@echo Setting %TARGET%-%COLOR% to tag %VERSION%
@tutum service set --image tutum.co/scenpoc/dnx-poc:%VERSION% --redeploy --sync %TARGET%-%COLOR%

@echo Linking load balancer to %TARGET%-%COLOR%
@tutum service set --link %TARGET%-%COLOR%:%TARGET%-%COLOR% %TARGET%-lb