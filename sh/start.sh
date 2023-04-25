cd /opt/ranger-2.0.0-admin

# if [ -s `which lsof`];
# then
# sed -i 's#http://deb.debian.org#https://mirrors.ustc.edu.cn#g' /etc/apt/sources.list
# sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

# apt update && apt install lsof
# fi

# useradd -M solr
# rm -rf /opt/solr/bin/solr-*.pid
# mkdir -p /var/log/solr/ranger_audits
# chown -R solr:solr /var/log/solr/ranger_audits

# useradd -M ranger -p "ranger"

# /opt/ranger-2.0.0-admin/contrib/solr_for_audit_setup/setup.sh

# /opt/solr-8.6.3/ranger_audit_server/scripts/start_solr.sh

if [ -s `which python`];
then
sed -i 's#http://deb.debian.org#https://mirrors.ustc.edu.cn#g' /etc/apt/sources.list
sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

apt update && apt install -y python
fi

rm -rf /opt/ranger-2.0.0-admin/set_globals.log.*

RANGER_ADMIN_CONF=/opt/ranger-2.0.0-admin
/opt/ranger-2.0.0-admin/setup.sh
/opt/ranger-2.0.0-admin/set_globals.sh
ranger-admin start

tail -f ews/logs/catalina.out
