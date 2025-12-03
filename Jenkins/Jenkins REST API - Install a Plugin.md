# Jenkins REST API - Install a Plugin

<img width="1956" height="1106" alt="image" src="https://github.com/user-attachments/assets/0470fd9a-eaa3-4041-afdb-02b48df6d5d6" />
<img width="1910" height="1155" alt="image" src="https://github.com/user-attachments/assets/c84db1f6-feee-4acc-b170-fca1c89b47d6" />
<img width="1380" height="1182" alt="image" src="https://github.com/user-attachments/assets/5633d667-0d1a-47fd-b816-7d13436ea326" />
<img width="1228" height="1091" alt="image" src="https://github.com/user-attachments/assets/6bba4fd1-009e-4d3f-84e0-4ae5ae45dabe" />
<img width="1742" height="946" alt="image" src="https://github.com/user-attachments/assets/d910c68a-424b-45f4-8129-d9b17728c0a5" />
<img width="1062" height="437" alt="image" src="https://github.com/user-attachments/assets/e575ab64-5cb5-46af-ab8b-5c8cd09f801d" />
<img width="1276" height="753" alt="image" src="https://github.com/user-attachments/assets/b070ce90-192f-4366-b423-4bfb9a071243" />
<img width="1582" height="212" alt="image" src="https://github.com/user-attachments/assets/8225d24f-628a-4595-b17a-213ca6da9f35" />
<img width="1957" height="795" alt="image" src="https://github.com/user-attachments/assets/8b8ecd4b-5a82-4c00-8ff1-8bf52c1bf534" />
<img width="2000" height="791" alt="image" src="https://github.com/user-attachments/assets/2f95578d-a56d-43d5-82e8-b9f916d4f93f" />

# Jenkins CRUMB

In Jenkins, a CRUMB is a security token used to protect against Cross-Site Request Forgery (CSRF) attacks. CSRF is a vulnerability where an attacker can trick a user into performing unwanted actions on a web application where they are authenticated.

Here's how CRUMB works in Jenkins:

- **Generation**: When a user logs into Jenkins, a unique and randomly generated crumb token is created for their session. This token is typically a hash of details like the username, session ID, IP address, and a unique Jenkins instance "salt."
- **Submission Requirement**: For any action that modifies data or triggers processes in Jenkins (e.g., building a job, changing configurations, submitting forms), the client (browser or API client) must include this crumb token in the request header or as a form parameter.
- **Validation**: Jenkins validates the received crumb token against the stored session information. If the token is valid and matches the user's session details, the request is processed. If it's invalid or missing, the request is rejected, preventing potential CSRF attacks.

## Key aspects of Jenkins CRUMB

- **CSRF Protection**: Its primary purpose is to safeguard against unauthorized actions initiated by malicious websites or scripts.
- **Session-Specific**: Crumbs are tied to individual user sessions, ensuring that only the legitimate user can perform actions within their session.
- **Default Enabled**: CSRF protection with crumb tokens is enabled by default in Jenkins and is highly recommended to remain active for security reasons.
- **API Interaction**: When interacting with Jenkins through its API (e.g., using curl or other tools), the crumb token needs to be explicitly obtained and included in the request headers for actions that require it. This is typically done by querying the /crumbIssuer/api/json or /crumbIssuer/api/xml endpoint.


Here’s a clean Markdown note you can save about CRUMB in Jenkins.

***

# What Is a CRUMB in Jenkins?

## Basic concept

- In Jenkins, a “crumb” is a special security token used to protect against CSRF (Cross-Site Request Forgery) attacks.[1]
- When a user (or script) interacts with Jenkins and tries to perform a state-changing action (like triggering a build via POST), Jenkins expects a valid crumb to be included in the request.[4][1]

## Why Jenkins uses crumbs

- CSRF is an attack where a malicious site tricks a logged‑in user’s browser into sending unwanted requests to another site (like Jenkins) without the user realizing it.[4]
- To prevent this, Jenkins generates a unique crumb per session/user and checks it on each modifying request; if the crumb is missing or invalid, Jenkins returns errors like “403 No valid crumb was included in the request.”[2][1]

## How a crumb works internally

- Jenkins generates the crumb by hashing several pieces of information, for example:
  - Username the crumb was created for.
  - Web session ID.
  - Client IP address.
  - A salt unique to that Jenkins instance.[3][1]
- When the crumb comes back in a request, Jenkins verifies that all these details still match; if they don’t, the crumb is considered invalid.[1][3]

## Where crumbs are used

- Any form submission or HTTP POST that changes Jenkins state (starting builds, saving config, creating jobs, etc.) may require a crumb.[1]
- This applies both to:
  - Web UI actions (buttons, forms).
  - Scripted/API calls that authenticate with username/password.[3][1]

## Using crumbs with the REST API

- To use Jenkins securely from scripts or tools (like curl), you typically:
  1) Request a crumb from the crumb issuer endpoint, e.g. `/crumbIssuer/api/json` or `/crumbIssuer/api/xml`.[3]
  2) Jenkins responds with:
     - The crumb value.
     - The header name to send it with (often `Jenkins-Crumb`).[3]
  3) You include:
     - That header (`Jenkins-Crumb: <crumb-value>`).
     - The session cookie that was set when you fetched the crumb.[5][3]
  4) Then send your POST request to trigger a job or modify configuration.

- Example pattern (conceptual):
  - Get crumb: send authenticated request to `/crumbIssuer/api/json`.
  - Use crumb: add header `Jenkins-Crumb: <value>` in subsequent POST calls along with the session cookie.[5][3]

## Alternative: API tokens

- If you authenticate using a Jenkins API token instead of username/password, CSRF protection is often handled differently, and many actions do not require a crumb when using API tokens.[6][3]
- This makes automation easier and is considered a best practice for scripted access.[6][3]

## Interview-style explanation

- Short, simple answer you can give:
  - “In Jenkins, a crumb is a CSRF protection token. Jenkins generates a unique crumb per session and requires it on POST requests that change state, like triggering builds or updating config. When calling the Jenkins API from scripts, you usually fetch a crumb from the `/crumbIssuer` endpoint and include it as a header (like `Jenkins-Crumb`) along with the session cookie to avoid 403 ‘No valid crumb’ errors.”[4][1][3]


# Either Use CRUMB or API Token
## First the API Token
<img width="2047" height="1147" alt="image" src="https://github.com/user-attachments/assets/7649e4ea-f3f2-43f4-8e4a-a4a8eb665ad9" />
<img width="1581" height="1047" alt="image" src="https://github.com/user-attachments/assets/e7ed7a20-97c3-4c8e-8fb9-5a96911319bb" />
<img width="1890" height="1093" alt="image" src="https://github.com/user-attachments/assets/68add466-a137-4489-9434-3dff5432f0f5" />
<img width="1992" height="306" alt="image" src="https://github.com/user-attachments/assets/c3ed54ec-e0ea-474e-bb0f-01ed545a7c5f" />
<img width="2067" height="1107" alt="image" src="https://github.com/user-attachments/assets/df3d5f0e-0d0b-4054-8259-53ad921df822" />

# Rest API can be used for other various tasts
**Like Install plugin**
<img width="1756" height="387" alt="image" src="https://github.com/user-attachments/assets/95e160c5-ae07-4fcd-9b37-e5adfefb527f" />
<img width="1962" height="1101" alt="image" src="https://github.com/user-attachments/assets/ad924793-47d6-4e67-b819-ca01eb0990eb" />
<img width="1941" height="1098" alt="image" src="https://github.com/user-attachments/assets/23c0c436-1065-45ec-a405-30dced9719ef" />
<img width="2015" height="998" alt="image" src="https://github.com/user-attachments/assets/65bc201d-7645-49aa-ad64-1ccc39afa8e4" />
<img width="1695" height="1022" alt="image" src="https://github.com/user-attachments/assets/7d912599-3309-4d20-8037-1972f50e7def" />
