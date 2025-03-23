*** Settings ***
Library        SeleniumLibrary
Resource       ../keywords/Keyword.robot
Resource       ../variables/Variable.robot

*** Test Cases ***
Create an account with an invalid email ID
    [Template]      Creating Account with both postive and negative scenarios
    [Documentation]     This test case verifies that the system does not allow account creation with an invalid email format.
    user        01        test.com        Pass!1234        Pass!1234        //div[@class='mage-error' and @id='email_address-error']

Testcase 2 - Create an account with an invalid password
    [Template]      Creating Account with both postive and negative scenarios
    [Documentation]    This test case verifies that the system enforces the minimum password length requirement during account creation.
    user        02        invalid@gmail.com        Pa        Pa        //div[text()='Minimum length of this field must be equal or greater than 8 symbols. Leading and trailing spaces will be ignored.']

Testcase 3 - Create an account with mismatched confirmation password
    [Template]      Creating Account with both postive and negative scenarios
    [Documentation]     This test case verifies that the system displays an error when the password and confirmation password do not match.
    user        03        test@gamil.com        Pass!234        Pass        //div[text()='Please enter the same value again.']

Testcase 4 - Create an account with empty mandatory fields
    [Template]      Creating Account with both postive and negative scenarios
    [Documentation]     This test case verifies that the system displays appropriate error messages when required fields are left empty during account creation.
    user        ${EMPTY}        ghgh@gamil.com        pass!3434        pass!3434        //div[@for="lastname" and text()='This is a required field.']

Testcase 5 - Successfully create an account
    [Template]      Creating Account with both postive and negative scenarios
    [Documentation]     This test case verifies that a user can successfully create an account with valid details and receive a confirmation message.
    admin       user        admin@gmail.com        Pass!12345        Pass!12345        //*[text()='Thank you for registering with Main Website Store.']
    
Testcase 6 - Attempt to create an account with an already registered email
    [Template]      Creating Account with both postive and negative scenarios
    [Documentation]     This test case verifies that the system prevents duplicate account creation by displaying an appropriate error message when using an existing email ID.
    admin        user        admin@gmail.com        Pass!12345        Pass!12345        //*[text()='There is already an account with this email address. If you are sure that it is your email address, ']

Testcase 7 - Successfully sign in to the website hbhbhbh
    [Template]      Signing to the website with both positive and negative credentials
    [Documentation]     This test case verifies that a registered user can successfully sign in with valid credentials.
    admin@gmail.com        Pass!12345        //div[@class='mage-error' and @id='email_address-error']

Testcase 8 - Attempt to sign in with invalid credentials
    [Template]      Signing to the website with both positive and negative credentials
    [Documentation]     This test case verifies that the system displays an error when a user attempts to log in with incorrect credentials.
    test@gmail.com        Pass&1234        //*[text()='The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.']

Testcase 9 - Sign in with an invalid email format
    [Template]  Signing to the website with both positive and negative credentials
    [Documentation]     This test case verifies that the system displays an appropriate error message when a user attempts to sign in with an incorrectly formatted email address.
    test.com        user        //div[@id="email-error" and text()='Please enter a valid email address (Ex: johndoe@domain.com).' ]
    
Testcase 10 - Attempt to sign in with empty fields
    [Template]      Signing to the website with both positive and negative credentials
    [Documentation]     This test case verifies that the system prompts the user to enter credentials when trying to log in with empty fields.
    user@gmail.com        ${empty}        (//*[text()='This is a required field.'])[1]