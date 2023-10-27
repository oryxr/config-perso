#!/bin/sh
### BEGIN INIT INFO
# Provides:          Mon Firewall
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:
# Default-Stop:
# X-Interactive:     false
# Short-Description: Mon Firewall
### END INIT INFO
# liens web: https://www.informatiweb-pro.net/admin-systeme/linux/ubuntu-securiser-votre-serveur-dedie-ou-vps-avec-iptables.html
echo "Configuration du pare-feu ..."

# Mise à 0
iptables -t filter -F
iptables -t filter -X
echo "Pare-feu remis à 0"

# On bloque le traffic entrant et redirigé
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
echo "Traffic entrant et redirigé bloqué"

# On autorise le traffic sortant
iptables -t filter -P OUTPUT ACCEPT
echo "Traffic sortant autorisé"

# On ne casse pas les connexions établies
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
echo "Connexions établies autorisées"

# Autorise le traffic entrant et sortant sur l'interface de bouclage réseau (loopback) (IP : 127.0.0.1)
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT
echo "Traffic de loopback autorisé"

# ICMP (le ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
echo "Ping autorisé"

# SSH entrant/sortant
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --sport 22 -j ACCEPT
echo "SSH autorisé"
 
# DNS entrant/sortant
# Requêtes DNS effectuées par le serveur (TCP et UDP)
iptables -t filter -A OUTPUT -p tcp --sport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --sport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT
# Requêtes DNS envoyées par les clients et donc reçues par le serveur (TCP et UDP)
iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT
echo "DNS autorisé"
 
# NTP sortant (serveur de temps)
iptables -t filter -A OUTPUT -p udp --sport 123 -j ACCEPT
echo "ntp ok"
 
# HTTP + HTTPS entrant/sortant (Serveur Web : HTTP (80) et HTTPS sécurisé par SSL (443 ou 8443)
iptables -t filter -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --sport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 8443 -j ACCEPT
 
# Mail SMTP:25 (Protocole d'envoi d'e-mails)
iptables -t filter -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --sport 25 -j ACCEPT
 
# Mail POP3:110 (Protocole de récupération d'e-mail)
iptables -t filter -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --sport 110 -j ACCEPT
 
# Mail POP3S:995 (Protocole de récupération d'e-mail)
# POP3S est un protocole POP3 sécurisé via SSL (POP3 Over SSL)
iptables -t filter -A INPUT -p tcp --dport 995 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --sport 995 -j ACCEPT
 
# Mail IMAP:143 (Protocole permettant de consulter ses mails via un système de dossiers distants)
iptables -t filter -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --sport 143 -j ACCEPT
echo "Protocoles e-mails autorisés"

# FTP sortant
#iptables -t filter -A OUTPUT -p tcp --sport 21 -j ACCEPT
#iptables -t filter -A OUTPUT -p tcp --sport 20 -j ACCEPT
# FTP entrant
#iptables -t filter -A INPUT -p tcp --dport 20 -j ACCEPT
#iptables -t filter -A INPUT -p tcp --dport 21 -j ACCEPT
#echo "FTP autorisé"
 
# FTP Passive
#iptables -t filter -A OUTPUT -p tcp --sport 50000:50100 -j ACCEPT
#iptables -t filter -A INPUT -p tcp --dport 50000:50100 -j ACCEPT
#echo "Port passifs du serveur FTP autorisés"

echo "Configuration du pare-feu terminée"
