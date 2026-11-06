import mysql.connector as mysql
from claim import Claim
from employee import Employee
mydb= mysql.connect(host="172.19.35.182" ,user="root",password="tiya007",database="claim_mgmt")
mycursor = mydb.cursor()



class ClaimRepository:

    def emp_login(empcode:str, password:str)-> Employee:

        query="select emp.emp_code, emp.first_name, emp.last_name, emp.gender from claim_mgmt.employee emp claim_mgmt.emp_login login where emp.emp_id = login.emp_id and login.USERNAME =%s and login.PASSWORD = %s;"
        mycursor.execute(query,empcode, password)
        records = mycursor.fetchall()
        if records != None:
            for record in records:
                employee = Employee()
                employee.emp_code = record[0]
                employee.first_name = record[1]
                employee.last_name = record[2]
                employee.gender = record[3]
                return employee
        
        return None

    # return the list of Claims against for and employee code
    def get_all_claims(user_empcode)-> list[Claim]:
        query="select CLAIM_ID, CLAIM_CODE from claim_mgmt.claims where EMP_CODE =%s;"
        mycursor.execute(query,(user_empcode,))
        records = mycursor.fetchall()

        claims = []
        if records:
            print("RECORDS FOUND")
            for i in records:
                claim = Claim()
                claim.id = i[0]
                claim.claimcode = i[1]
                print(claim.id, " --- " ,claim.claimcode)
                #print(i)
                claims.append (claim)
        else:
            print("NO RECORDS FOUND")
        return claims




    def get_role(user_empcode)->list[Claim]:
        query = "SELECT roles.emp_id, roles.role FROM claim_mgmt.roles, claim_mgmt.emp_login WHERE roles.emp_id = emp_login.emp_id AND emp_login.EMP_CODE = %s;"
        mycursor.execute(query,(user_empcode,))
        record = mycursor.fetchone()
        roles=[]
        if record:
            for i in record:
                claim = Claim()
                claim.role = i[1]
                roles.append(claim)
        else:
            print("NO RECORDS FOUND")
        return roles

    def get_claim_detais(user_claim_code):
        query = "select CLAIM_ID ,CLAIM_CODE, CLAIM_CATEGORY_CODE ,CLAIM_AMOUNT ,CLAIM_TITLE,CLAIM_DESC ,CLAIM_SUB_DATE ,CLAIM_APR_DATE ,CLAIM_STATUS from claim_mgmt.claims where CLAIM_CODE = %s;"
        mycursor.execute(query,(user_claim_code,))
        records = mycursor.fetchall()

        claim_details = []
        if records:
            claim = Claim()
            for i in records:
                claim.claimid = i[0]
                claim.claimcode = i[1]
                claim.claim_category_code = i[2]
                claim.claim_amt = i[3]
                claim.claim_title = i[4]
                claim.claim_desc = i[5]
                claim.claim_subdate = i[6]
                claim.claim_aprdate = i[7]
                claim.claim_status = i[8]
                claim_details.append(claim)
                
        else:
            print("NO RECORDS")
        return claim_details

    def get_claim_status(user_claim_code):
        query = "select CLAIM_STATUS from claim_mgmt.claims where CLAIM_CODE = %s;"
        mycursor.execute(query,(user_claim_code,))
        records = mycursor.fetchall() 
        claim_status = []
        if records:
            claim = Claim():
            for i in records:
                claim.claim_status = i[0]
            claim_status.append(claim)
        else:
            print("NO RECORDS")
        return claim_status   

    def check_validity(user_empcode):
        query = "SELECT eligibility.MAX_AMOUNT - COALESCE(SUM(claims.CLAIM_AMOUNT), 0) AS BALANCE FROM employee, eligibility, claims WHERE employee.emp_code = eligibility.emp_code AND employee.emp_code = claims.emp_code AND GROUP BY eligibility.MAX_AMOUNT AND employee.emp_code = %s;"

        mycursor.execute(query,(user_empcode))
        records=mycursor.fetchall()

        for record in records:
            if record[0]>0:
                print("BALANCE REMAINING:",record[0])
            else:
                print("NO BALANCE REMAINING.\nMAX AMOUNT HAS BEEN USED UP")  


    def get_latest_claim(user_empcode):
        query = "select claim_code from claim_mgmt.claims order by claim_id desc limit 1 where emp_code=%s;"
        mycursor.execute(query,(user_empcode,)) 
        records=mycursor.fetchone()

        if records:
            return records[0]
        else:
            return None    


        # for the input claim inssert the details into claims table
    def add_claims():

        query = "inset into claim_mgmt.claims(CLAIM_ID, CLAIM_CODE,EMP_CODE, CLAIM_CATEGORY_CODE, CLAIM_AMOUNT, CLAIM_TITLE, CLAIM_DESC, CLAIM_SUB_DATE, CLAIM_APR_DATE, CLAIM_STATUS) VALUES (?,?,?,?,?,?,?,?,?,?);"
        mycursor.execute(query,(Claim.claimid,Claim.claimcode,Claim.empcode,Claim.claim_category_code,Claim.claim_amt,Claim.claim_title,Claim.claim_desc,Claim.claim_subdate,Claim.claim_aprdate,Claim.claim_status))  
        mydb.commit()
        print("CLAIM REGISTERED SUCESSFULLY!")






def main():
    #user_empcode = input("ENTER EMPLOYEE CODE:")
    user_empcode = ClaimRepository.emp_login()
    claims = ClaimRepository.get_all_claims(user_empcode) 
    if claims != None:
        for claim in claims:
            print(claim.id, "****", claim.claimcode) 

if __name__ == "__main__":
    main()
            
