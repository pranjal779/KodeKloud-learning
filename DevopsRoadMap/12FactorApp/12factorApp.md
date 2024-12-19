1. Codebase
2. Dependencies
3. config
4. Backing Services
5. Build, release, run
6. Processes
7. Port Binding
8. Concurrency
9. Disposability
10. Dev/prod parity
11. Logs
12. Admin Processes

-----------

1. (1)Codebases  
![image](https://github.com/user-attachments/assets/d4461627-d043-4ae0-aec6-69955bb9463e)

2. (2)Dependencies  
   Explicitly declare and isolate dependencies  
A twelve factor app never relies on implicit existence of system-wide packages.

3. (8)Concurrency

4. (6)Processes
   Twelve-factor processes are stateless and share-nothing
   Sticky sessions are a violation of twelve-factor and should never be used or relied upon.

5. (4)Backing Services
   

6. (3)Config
   The Twelve-factor app stores config in environment variables.

7. (5)Build, Release and Run  
   The twelve-factor app uses strict separation between the build, release, and run stages.  
   ![image](https://github.com/user-attachments/assets/72df0424-3d9c-4723-af2f-41deec867a8d)

8. (7)Port Binding

9. (9)Disposability
    The twelve-factor app's processes are disposable, meaning they can be started or stopped at a moment's notice.
   The twelve-factor app's processes should shutdown gracefully when they recveive a SIGTERM signal from the process manager.

10. (10) Dev/prod parity
    ![image](https://github.com/user-attachments/assets/c979426e-30f3-4ba2-9e27-495d79af53a8)
    
11. (11) Logs
    A twelve-factor app never concerns itself with routing or storage of its output stream.
    Store logs in a centralized location in a structured format.
    example: for logging solutions:
    ![image](https://github.com/user-attachments/assets/e648923f-5218-4f6b-a043-f9222c5bb443)

12. (12) Admin Processes
        
