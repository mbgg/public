# Generate config files

# src https://superuser.com/questions/105231/use-rsync-to-copy-all-files-except-for-certain-filenames-with-a-certain-extensio
rsync -avq --exclude='*.j2' --exclude='*.swp' --exclude='*~' template/ trax1/
rsync -avq --exclude='*.j2' --exclude='*.swp' --exclude='*~' template/ trax2/

ansible-playbook -c local -i localhost, playbook_local.yml

rm -f playbook_local.retry
