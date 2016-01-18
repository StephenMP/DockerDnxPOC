@echo off

echo ==================================================
echo Beginning Deployment
echo --------------------------------------------------

: Get necessary data for what to deploy
set /p VERSION= "What version to deploy?  "
set /p TARGET= "What stack to target?  "
set /p COLOR= "What color to deploy?  "

: Tag the target service with the image version we want
echo Setting %TARGET%-%COLOR% to version %VERSION%
tutum service set --image tutum.co/scenpoc/dnx-%TARGET%:%VERSION% --redeploy --sync %TARGET%-%COLOR%

: Wait for 5 minutes for the service to fully stand up
echo Waiting for the Service to Mature
timeout /t 300

: Link the load balancer to the updated service
echo Linking load balancer to %TARGET%-%COLOR%
tutum service set --link %TARGET%-%COLOR%:%TARGET%-%COLOR% %TARGET%-lb

: All done :)
echo Deployment Complete!
echo ==================================================