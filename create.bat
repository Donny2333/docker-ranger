docker rm -f ranger
docker run -d ^
-it ^
-p 6080:6080 ^
-p 6083:6083 ^
--name ranger ^
--hostname ranger ^
--net my-network --ip 172.20.1.72 ^
--link mysql8:mysql8 ^
-v %cd%\java:/usr/share/java ^
-v %cd%\sh\start.sh:/root/start.sh ^
-v %cd%\ranger-2.0.0-admin:/opt/ranger-2.0.0-admin ^
-v %cd%\solr:/opt/solr ^
-v %cd%\conf:/etc/ranger/admin/conf ^
--privileged=true ^
openjdk:8 ^
bash -c "/root/start.sh; bash"
