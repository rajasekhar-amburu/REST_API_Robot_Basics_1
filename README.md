Robot Libraries -> Standard Libraries, External Libraries (Selenium, HTTP Requests)

Installation
------------
1. pip install robotframework
2. pip install requests
3. pip install robotframework-requests
4. pip install jsonpath_rw
5. pip install jsonpath_rw_ext
6. pip install robotframework-jsonlibrary

File Structure
--------------
- Testcase Files (.robot) - We will write testcases here
- Resources Files (.robot) - Reusable Code like functions, Keywords (will be called from testcases)
- Python Files (.robot) - (User defined Keywords)
- Excel File (.xlsx) - Test Data
- JSon File (Request Content) - 
- HTML File (results)
- Log files

Robot-File Sections
-------------------
1. Settings : Add / Use any library
2. Variables : User defined variables
3. Testcases : Main testcases will be written under here, We will not use this section in resource files
4. Keywords : This will be written under resources files and will be used by the testcases.robot files. We will not use this in testcases files


Rules to be followed in Robot Framework
----------------------------------------
1. Install all the packages needed
2. Exact 1 space if you have keyword have space
3. Exact 2 spaces or tab in all other places
4. Body of the testcase should be in indendation
5. To execute a testcase : robot <filename>
