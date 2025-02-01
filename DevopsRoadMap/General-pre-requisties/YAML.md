# What is Yaml
# Yaml
- Key Value Pair
- ![image](https://github.com/user-attachments/assets/4bb43607-c5cf-492b-a94a-71b46f2ef117)


## SPACES


## Yaml Advanced
- ![image](https://github.com/user-attachments/assets/a506a78d-44f3-4ee5-806c-c1a7c884c097)


## Dictionary vs List vs List f Dictionaries 
![image](https://github.com/user-attachments/assets/af1fc650-ced4-4e04-8ddc-2167e1b0aeb8)

## Yaml notes
![image](https://github.com/user-attachments/assets/31f8b5b0-12b8-4ec9-949b-7326f5dc1ff1)


# Labs

```yaml
# [bob@student-node ~]$ cat /home/bob/playbooks/practice.yaml 
employees:
  - employee:
      name: john
      gender: male
      age: 24
# [bob@student-node ~]$
```


```yaml
# [bob@student-node ~]$ cat /home/bob/playbooks/practice.yaml 
employees:
  - name: john
    gender: male
    age: 24

  - name: sarah
    gender: female
    age: 28

# [bob@student-node ~]$
```


```yaml
#[bob@student-node ~]$ cat /home/bob/playbooks/practice.yaml 
employee:
  name: john
  gender: male
  age: 24
  address:
    city: 'edison'
    state: 'new jersey'
    country: 'united states'
  payslips:
    - month: june
      amount: 1400
    - month: july
      amount: 2400
    - month: august
      amount: 3400
#[bob@student-node ~]$
```
