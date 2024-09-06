import paramiko
import sys
import csv

def block_ip_on_ubuntu(ip_address, ubuntu_host, ubuntu_user, key_file):
    try:
        # Créer un client SSH
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        # Charger la clé privée RSA
        private_key = paramiko.RSAKey.from_private_key_file(key_file)

        # Se connecter à la machine Ubuntu avec la clé RSA
        ssh.connect(ubuntu_host, username=ubuntu_user, pkey=private_key)

        # Vérifier si l'IP est déjà bloquée sur la machine Ubuntu
        check_ip_command = f"sudo iptables -L INPUT -v -n | grep {ip_address}"
        stdin, stdout, stderr = ssh.exec_command(check_ip_command)
        existing_rule = stdout.read().decode()

        if existing_rule:
            print(f"L'adresse IP {ip_address} est déjà bloquée.")
            ssh.close()
            return

        # Bloquer l'IP avec iptables
        block_ip_command = f"sudo iptables -A INPUT -s {ip_address} -j DROP"
        stdin, stdout, stderr = ssh.exec_command(block_ip_command)

        # Vérifier si la commande a réussi
        if stderr.read():
            print(f"Erreur lors du blocage de l'adresse IP {ip_address}.")
        else:
            print(f"L'adresse IP {ip_address} a été bloquée avec succès.")

        # Fermer la connexion SSH
        ssh.close()

    except Exception as e:
        print(f"Erreur lors de la connexion SSH ou de l'exécution de la commande : {str(e)}")

def get_ip_from_results(results_file):
    try:
        with open(results_file, 'r') as file:
            csv_reader = csv.DictReader(file)
            for row in csv_reader:
                return row['ip']  # Assurez-vous que 'ip' est bien le nom du champ contenant l'IP
    except Exception as e:
        print(f"Erreur lors de la lecture du fichier des résultats : {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python block_ip.py <RESULTS_FILE>")
        sys.exit(1)

    # Fichier contenant les résultats de l'alerte Splunk
    results_file = sys.argv[1]

    # Récupérer l'adresse IP de l'attaquant à partir des résultats
    ip_address = get_ip_from_results(results_file)

    # Détails de la machine Ubuntu
    ubuntu_host = "192.168.1.113"  # IP de la machine Ubuntu
    ubuntu_user = "mohamed"  # Nom d'utilisateur SSH sur Ubuntu
    key_file = "C:\Users\mohamed\.ssh\id_rsa"  # Chemin vers la clé privée RSA

    # Appeler la fonction pour bloquer l'IP
    if ip_address:
        block_ip_on_ubuntu(ip_address, ubuntu_host, ubuntu_user, key_file)
    else:
        print("Aucune adresse IP à bloquer n'a été trouvée dans les résultats.")
