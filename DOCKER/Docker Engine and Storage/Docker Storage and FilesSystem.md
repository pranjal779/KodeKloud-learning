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
- 
