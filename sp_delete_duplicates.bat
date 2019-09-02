REM @echo off
date /t
time /t
echo.
rem Create the date and time elements.
For /f "tokens=1-7 delims=:/-, " %%i in ('echo exit^|cmd /q /k"prompt $D $T"') do (
        For /f "tokens=2-4 delims=/-,() skip=1" %%a in ('echo.^|date') do (
                set dow=%%i
                set %%a=%%j
                set %%b=%%k
                set %%c=%%l
                set hh=%%m
                set min=%%n
                set ss=%%o
        )
)

REM For %%i in (dow dd mm yy hh min ss) do set %%i

title Delete Duplicates  %yy%/%mm%/%dd% %dow% %hh%:%min%:%ss%

REM smallKi+e83  openport
sqlcmd -Q "exec sp_uat_phsdiy" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_uat_phsdiy.txt
sqlcmd -Q "exec sp_uat_poc_status" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_uat_poc_status.txt
sqlcmd -Q "exec sp_delete_duplicates" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_delete_duplicates.txt
sqlcmd -Q "exec sp_delete_duplicates2" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_delete_duplicates2.txt
sqlcmd -Q "exec product_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\product_deletedups.txt
sqlcmd -Q "exec shipment_relay_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\shipment_relay_deletedups.txt
sqlcmd -Q "exec liquidity_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\liquidity_deletedups.txt
sqlcmd -Q "exec sg_liquidity_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sg_liquidity_deletedups.txt
sqlcmd -Q "exec pk_ping_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\pk_ping_deletedups.txt
sqlcmd -Q "exec phspng_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\phspng_deletedups.txt
sqlcmd -Q "exec sp_delete_duplicates3" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_delete_duplicates3.txt
sqlcmd -Q "exec sp_delete_duplicates5" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_delete_duplicates5.txt
sqlcmd -Q "exec sp_delete_duplicates6" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_delete_duplicates6.txt
sqlcmd -Q "exec sgp1_powerbidata_dp" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sgp1_powerbidata_dp.txt
sqlcmd -Q "exec sgp1_carrierdata_dp" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sgp1_carrierdata_dp.txt
sqlcmd -Q "exec sgp1_liquidity_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sgp1_liquidity_deletedups.txt
sqlcmd -Q "exec sgp1_driverstatus_deletedups" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sgp1_driverstatus_deletedups.txt
sqlcmd -Q "exec sp_pk_param_config" -S "opserver.database.windows.net" -d opdb -U ivruser -P ivrus3Rlonger -o C:\logs\sp_pk_param_config.txt


REM pause
echo.
echo Closing in approximately 1 second
ping -n 1 127.0.0.1 > nul
exit
