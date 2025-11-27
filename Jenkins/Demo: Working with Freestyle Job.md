<img width="2041" height="1315" alt="image" src="https://github.com/user-attachments/assets/25d82d24-6f3e-4c33-a1bb-710b441f1487" />
<img width="2186" height="1395" alt="image" src="https://github.com/user-attachments/assets/11289659-e643-4a77-b1bb-7dc19af00033" />

**code used in the Build step
```sh
#  Build a message by invoking ADVICESLIP API
curl -s https://api.adviseslip.com/advice > advice.json
cat advice.json


# Test to make sure the advice message has more than 5 words.
cat advice.json | jq -r .slip.advice > advice.message
[ $(wc -w < advice.message) -gt 5] && echo "Advice has more than 5 words" || (echo "Advice - $(cat advice.message) has 5 words or less" && exit 1)

# Deploy
sudo apt-get install cowsay -y
cat advice.message | 
```
