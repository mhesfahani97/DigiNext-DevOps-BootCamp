1. Setup MariaDB
    - deploy container
        ```
        docker compose up -d
        docker exec -it <container_id> bash
        ```
    - in container
        `mysql -u root -phello`

2. create database
    ```
    create database nation;
    show databases;
    use nation;
    source /root/tables.sql
    ```

3. select command 
    - `source /root/select.sql

4. 
