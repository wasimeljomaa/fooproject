public class Employee {
    public String  EmployeeName;
    public int EmployeeAge;
    public static int idCounter = 0;
    public int EmployeeId;
    public double EmployeeSalary;

    public Employee(String EmployeeName, int EmployeeAge, int EmployeeSalary) {
        idCounter++;
        this. EmployeeName =  EmployeeName;
        this.EmployeeAge = EmployeeAge;
        this.EmployeeSalary = EmployeeSalary;
        this. EmployeeId = idCounter;
    }

    public String getName() {
        return  EmployeeName;
    }

    public void setName(String name) {
        this. EmployeeName =  EmployeeName;
    }

    public int getAge() {
        return EmployeeAge;
    }

    public void setAge(int EmployeeAge) {
        this.EmployeeAge = EmployeeAge;
    }

    public int getId() {
        return EmployeeId;
    }

    public void setId(int  EmployeeId) {
        this. EmployeeId =  EmployeeId;
    }

    public double getSalary() {
        return EmployeeSalary;
    }

    public void setSalary(int EmployeeSalary) {
        this.EmployeeSalary = EmployeeSalary;
    }
    //VG Delen
    public void raiseSalary(double percent) {
        if(percent > 0 && percent < 101) {
            this.EmployeeSalary = this.EmployeeSalary * (percent / 100 + 1.0);
        }
    }
}
