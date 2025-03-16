# TP_IAAS

- Aller dans le répertoire terraform/ :
    cd terraform

- Initialiser Terraform (télécharge les providers, modules, etc.) :
    terraform init

- Appliquer la configuration :
    terraform apply -auto-approve

    
Terraform va créer les VMs “app” et “bdd” en se basant sur vos modules.
Il générera ensuite un fichier ansible/inventory.ini contenant les IP.
Enfin, via un null_resource + local-exec, il exécutera ansible-playbook avec l’inventaire généré.

Vérifier que tout s’est bien passé. À la fin de l’exécution, vous devriez voir les tâches Ansible s’enchaîner et se terminer sans erreur.