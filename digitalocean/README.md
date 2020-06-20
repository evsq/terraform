# Get token for variable TOKEN
https://cloud.digitalocean.com/account/api

# Get ssh key fingreprint for variable SSH_FINGERPRINT
ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub | awk '{print $2}'

# Get available images
curl -X GET -H "Authorization: Bearer $TOKEN" "https://api.digitalocean.com/v2/images?per_page=999" 

# Get available regions
curl -X GET -H "Authorization: Bearer $TOKEN" "https://api.digitalocean.com/v2/regions" 
