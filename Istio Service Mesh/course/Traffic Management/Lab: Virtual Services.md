# Lab: Virtual Services

<img width="998" height="715" alt="image" src="https://github.com/user-attachments/assets/6db7bd63-ffe7-4d65-af4c-a49a65e58a19" />
<img width="996" height="802" alt="image" src="https://github.com/user-attachments/assets/8cd0e4ac-58c0-4d7f-81d3-b153b37a7e4e" />
<img width="1028" height="533" alt="image" src="https://github.com/user-attachments/assets/4d653dcc-05de-4a10-98bb-de8aa0a7c3ca" />
<img width="962" height="647" alt="image" src="https://github.com/user-attachments/assets/b6ff11a4-8b07-4719-95e1-3d1a180faf19" />
<img width="1017" height="717" alt="image" src="https://github.com/user-attachments/assets/0eb4300b-05d2-405f-b26e-99f29345e61b" />
<img width="1057" height="667" alt="image" src="https://github.com/user-attachments/assets/14a8bd43-2345-49d0-94a6-a4f77cdbddad" />
<img width="1015" height="677" alt="image" src="https://github.com/user-attachments/assets/a11e7227-5667-4de4-bd9e-e3dc6f548603" />
<img width="883" height="492" alt="image" src="https://github.com/user-attachments/assets/45f7f882-7e5a-43c6-b8b6-50840a25f1bd" />
<img width="1028" height="617" alt="image" src="https://github.com/user-attachments/assets/d5eae15b-4cf8-4207-b5e5-ee04feafd65d" />
<img width="997" height="767" alt="image" src="https://github.com/user-attachments/assets/9c7f09cd-1619-4e0f-bb06-1e45b349b4aa" />
<img width="777" height="201" alt="image" src="https://github.com/user-attachments/assets/1242f249-043d-4ee0-a56b-b45b7ea1072c" />
<img width="978" height="845" alt="image" src="https://github.com/user-attachments/assets/2204e1f3-9303-41c4-9cc4-d7112c78ac97" />
<img width="2222" height="1106" alt="image" src="https://github.com/user-attachments/assets/e54082e4-0c0a-43e3-93cd-bbd7d7987018" />
<img width="1012" height="880" alt="image" src="https://github.com/user-attachments/assets/50bf19c5-7bcb-4c1f-8191-3de726eea9b7" />
<img width="996" height="678" alt="image" src="https://github.com/user-attachments/assets/3f1b0a01-c398-477e-80c5-0073c37111e4" />
<img width="712" height="162" alt="image" src="https://github.com/user-attachments/assets/7fec2874-7a27-4fde-a68c-2c63c2a54d4c" />
<img width="987" height="986" alt="image" src="https://github.com/user-attachments/assets/48b8e71f-9862-4281-b966-e203225a53bc" />
<img width="1788" height="767" alt="image" src="https://github.com/user-attachments/assets/97a149b4-4ccd-4f5c-9cf2-9693969fb1e4" />
<img width="2042" height="945" alt="image" src="https://github.com/user-attachments/assets/1898c293-eb43-4a8b-bc95-b38cb533ddb9" />
<img width="975" height="1102" alt="image" src="https://github.com/user-attachments/assets/8781d4e9-5a11-48cd-baeb-4bba364bfebf" />

```sh
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export TCP_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="tcp")].nodePort}')
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')
```

curl -s -I -HHost:httpbin.example.com "http://$INGRESS_HOST:$INGRESS_PORT/status/200"

curl -s -I -HHost:httpbin.example.com "http://$INGRESS_HOST:$INGRESS_PORT/delay/5"



<img width="2478" height="1051" alt="image" src="https://github.com/user-attachments/assets/e83ed844-176b-4752-a187-2c8a492f7e26" />
<img width="2487" height="1102" alt="image" src="https://github.com/user-attachments/assets/c5b7c41e-1940-43c1-877e-3ecf74f48992" />
<img width="962" height="1067" alt="image" src="https://github.com/user-attachments/assets/363c8032-1c5e-49f6-b6f9-fbffce6637eb" />
<img width="1011" height="523" alt="image" src="https://github.com/user-attachments/assets/b57dea96-2c09-4333-b427-3d9e1dff76d6" />
<img width="2510" height="1125" alt="image" src="https://github.com/user-attachments/assets/41bee346-a6a0-41cf-ad2a-fcd63d078035" />
<img width="993" height="510" alt="image" src="https://github.com/user-attachments/assets/ef67b03c-4dc9-4348-9b2b-a5ad1bd1cfba" />
<img width="812" height="182" alt="image" src="https://github.com/user-attachments/assets/97024393-6704-47d9-b065-6c0920e6ee8d" />
<img width="1011" height="1042" alt="image" src="https://github.com/user-attachments/assets/4b849ad6-0932-4c5e-ae1b-dc1e442f317d" />
<img width="1786" height="1102" alt="image" src="https://github.com/user-attachments/assets/baf2b391-32ba-4624-86a4-8c17c13f5f41" />
<img width="1117" height="297" alt="image" src="https://github.com/user-attachments/assets/d30b4d42-9f5c-41c4-b92c-5bb1c6245aff" />
<img width="2513" height="1186" alt="image" src="https://github.com/user-attachments/assets/e25b2156-870c-41ed-b534-964fe0813563" />
<img width="982" height="567" alt="image" src="https://github.com/user-attachments/assets/6e0946ce-1f85-4d97-8dea-f9910dc4f5e7" />
<img width="1548" height="1162" alt="image" src="https://github.com/user-attachments/assets/8a6dbdfb-90cf-4945-ad96-7a5d0b7a75f5" />











