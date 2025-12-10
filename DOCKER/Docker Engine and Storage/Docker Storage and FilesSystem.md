# Docker Storage and FilesSystem

# File System
<img width="852" height="747" alt="image" src="https://github.com/user-attachments/assets/930ef35c-05f0-4c8a-8c31-b2ab08374626" />

# Layered architecture
<img width="997" height="1102" alt="image" src="https://github.com/user-attachments/assets/bdbd7aaa-ce3b-4173-86b8-6c1148c95088" />
<img width="957" height="1111" alt="image" src="https://github.com/user-attachments/assets/74cd6166-2824-4f43-9a16-fa63592f0ad6" />
<img width="1032" height="1075" alt="image" src="https://github.com/user-attachments/assets/8dc31ec0-9c8d-4e83-aa04-624ce69fa93b" />
<img width="1962" height="1102" alt="image" src="https://github.com/user-attachments/assets/34578d7e-ab52-4c00-8777-22b74a5e77d7" />

- **Docker does not build the 1st 3 layers, instead it reuses the sam three layers it built for the first application from the cache and only creates the last two layers with the new sources and the new entrypoint.**
- **This way Docker builds images faster and efficiently saves disk space. This is also applicablbe if you were to update your application**
- <img width="1981" height="1095" alt="image" src="https://github.com/user-attachments/assets/e1aa4da8-1b04-4a46-8bd0-78c7da730692" />
- This is also applicable if you were to update you application code.
- Docker simply reuses all the previous layers from cache and quicly rebuilds the application image by updating the latest source code, thus saving us a lot of time during rebuilds and updates.


<img width="1506" height="961" alt="image" src="https://github.com/user-attachments/assets/42060852-80c7-4f32-aeaf-4956fd1c0a8f" />
<img width="1403" height="951" alt="image" src="https://github.com/user-attachments/assets/c45c7c7b-71d2-4a4c-8bce-1450dc4725a4" />
<img width="2392" height="1107" alt="image" src="https://github.com/user-attachments/assets/239c8e18-c3d4-4c2a-8dc6-4a131876d5ab" />
<img width="2348" height="1158" alt="image" src="https://github.com/user-attachments/assets/019cbed5-42a4-438a-b00d-b220ce021ee3" />

# COPY-ON-WRITE MECHANISM
<img width="2390" height="1031" alt="image" src="https://github.com/user-attachments/assets/6cc7b5e8-6dd5-4c06-8fc3-f6c9498e2342" />

# Volmues
<img width="1653" height="1047" alt="image" src="https://github.com/user-attachments/assets/e991b1fd-4828-486a-b799-4f1bc523f06a" />
<img width="2411" height="997" alt="image" src="https://github.com/user-attachments/assets/d3b9a89d-0903-418d-82c0-69d19db79e5d" />
<img width="2465" height="1145" alt="image" src="https://github.com/user-attachments/assets/18f414ee-f751-4c3f-b11a-c90bf2c7d842" />

## Volume Mounting in docker
<img width="2437" height="1092" alt="image" src="https://github.com/user-attachments/assets/26d3c056-676e-42b3-b75e-cd5e789b3856" />

## Bind Mount (Bind Mounting)
<img width="2491" height="1166" alt="image" src="https://github.com/user-attachments/assets/d4b2009c-e7bd-4ef7-b8fa-17263198c396" />
<img width="2422" height="1187" alt="image" src="https://github.com/user-attachments/assets/62db6094-666e-4f6c-abbf-0419f3fe1fc0" />
<img width="706" height="692" alt="image" src="https://github.com/user-attachments/assets/d7d7a3d6-ff31-468e-9ee3-530dd3680291" />
<img width="2475" height="1177" alt="image" src="https://github.com/user-attachments/assets/f8404a9c-2f17-47c9-a812-b9fffd8d1e41" />
<img width="590" height="1073" alt="image" src="https://github.com/user-attachments/assets/30ad38bc-e212-4d92-8652-2cd9bf8e7b38" />
<img width="580" height="997" alt="image" src="https://github.com/user-attachments/assets/102faa4c-6b7c-4bd2-9427-cc0e0f2a7374" />
