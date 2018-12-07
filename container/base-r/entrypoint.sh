#install R
sudo -i
yum install -y nano curl
amazon-linux-extras install -y R3.4

mkdir -p /var/analysis
cd /var/analysis

R -f /var/analysis/startup.r
