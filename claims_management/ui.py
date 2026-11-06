from claims_repository import ClaimRepository
from claim import Claim
from employee import Employee

def show_claims():
    empcode = input("enter the employee code")
    classRepo = ClaimRepository()
    claims_list: list[Claim]
    claims_list = classRepo.get_all_claims(empcode)

    for c in claims_list:
        print(c.empcode)
        print(c.claim_status)

def insertClaim():
    claimRepo = ClaimRepository()
    c = Claim()
    c.empcode = input("ENTER EMPLOYEE CODE:")
    c.claim_status = "PENDING"
    c.claim_title = input("ENTER CLAIM TITLE:")
    c.claim_amt = int(input("ENTER CLAIM AMOUNT:"))
    c.claim_category_code = input("ENTER CLAIM CATEGORY CODE (MOBILE/MEAL/BROADBAND):")
    c.claim_desc = input("ENTER CLAIM DESCRIPTION:")
    c.claim_subdate = input("ENTER SUBMISSION DATE(YYYY-MM-DD):")

    latest_code = claimRepo.get_latest_claim()
    
    if latest_code:
        next_num = int(latest_code.replace("CLM", "")) + 1
    else:
        next_num = 1
        
    c.claim_code = f"CLM{next_num:03d}"

    claimRepo.add_claims(c)
    print("CLAIMS REGISTER SUCESSFULL")


def show_status_of_claims():
    empcode = input("enter the employee code")
    classRepo = ClaimRepository()
    claims_list: list[Claim]
    claims_list = classRepo.get_claim_status(empcode)
    
    for c in claims_list:
        print(c.claimcode)
        print(c.claimid)
        print(c.claim_status)

def show_claim_details():
    cc = input("Enter Claim Code:")
    classRepo = ClaimRepository()
    clist = classRepo.get_claim_detais(cc)

    for c in clist:
        print(c.claimid)
        print(c.claimcode)
        print(c.claim_category_code)
        print(c.claim_amt)
        print(c.claim_title)
        print(c.claim_desc)
        print(c.claim_subdate)
        print(c.claim_aprdate)
        print(c.claim_status)



        



def main():

    employee:Employee = None

    while True:
        user_empcode = input("ENTER user name: ")
        password = input("enter password: ")

        
        employee  = ClaimRepository.emp_login(user_empcode, password)
        if employee != None:
            print (f"Welcome {employee.first_name} {employee.last_name}")
            break

           

   
    claims = ClaimRepository.get_all_claims(employee.emp_code) 
    if claims != None:
        for claim in claims:
            print(claim.id, "****", claim.claimcode)

    roles = ClaimRepository.get_role(employee.emp_code) 
    if roles != None:
        for r in roles:
            print(claim.role) 


    if claim.role == "EMPLOYEE":
        print("CHOOSE 1 FOR ADDING A NEW CLAIM")
        print("CHOOSE 2 TO VIEW EXISTING CLAIMS")
        print("CHOOSE 3 TO VIEW STATUS OF A CLAIM")  
        print("CHOOSE 4 TO VIEW DETAILS OF A PARTICULAR CLAIM")

        choice = int(input("ENTER CHOICE:"))
        match choice:
            case 1:
                insertClaim()

            case 2:
                show_claims()

            case 3:
                show_status_of_claims()

            case 4:
                show_claim_details()
                    



    elif claim.role == "MANAGER":
        print("CHOOSE 1 TO VIEW EMPLOYEES UNDER YOU ")
        print("CHOOSE 2 TO VIEW CLAIMS ISSUED BY A EMPLOYEE")
        print("CHOOSE 3 FOR ADDING A NEW CLAIM")
        print("CHOOSE 4 TO VIEW EXISTING CLAIMS")
        print("CHOOSE 5 TO VIEW STATUS OF A CLAIM")  
        print("CHOOSE 6 TO VIEW DETAILS OF A PARTICULAR CLAIM")
        choice = int(input("ENTER CHOICE:"))
        match choice:
            case 1:
                


            case 3:
                insertClaim()
        
            case 4:
                show_claims()
        
            case 5:
                show_status_of_claims()
        
            case 6:
                show_claim_details()
         
         
                        

if __name__ == "__main__":
    main()
            

