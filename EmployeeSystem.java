import java.util.ArrayList;

public class EmployeeSystem {
    public ArrayList<Employee> employeeList = new ArrayList<Employee>();

    public void addEmployee(Employee Anstalld1) {
        employeeList.add(Anstalld1);
    }

    public Employee getEmployee(int id) {
        return employeeList.get(id);
    }

    public void deleteEmployee(int id) {
        employeeList.remove(id);
    }

    //VG-delen
    public void raiseSalary(int id, double percent) {
        employeeList.get(id).raiseSalary(percent);
    }
}
