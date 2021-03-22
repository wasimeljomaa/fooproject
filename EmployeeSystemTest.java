import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;


public class EmployeeSystemTest {

    Employee Anstalld1 = new Employee("Wasim Eljomaa", 42, 32500);
    EmployeeSystem SystemAntslld = new EmployeeSystem();

    @Test
    void testEmployeeSystem(){
        EmployeeSystem SystemAntslld = new EmployeeSystem();

    }

    @Test
    void testAddEmployee(){
        SystemAntslld.addEmployee(Anstalld1);
        assertEquals(1, SystemAntslld.employeeList.size());
    }

    @Test
    void testGetEmployee(){
        SystemAntslld.addEmployee(Anstalld1);
        assertEquals(Anstalld1, SystemAntslld.getEmployee(0));
    }

    @Test
    void testDeleteEmployee(){
        SystemAntslld.addEmployee(Anstalld1);
        assertEquals(1, SystemAntslld.employeeList.size());
        SystemAntslld.deleteEmployee(0);
        assertEquals(0, SystemAntslld.employeeList.size());

    }
    //VG Delen
    @Test
    void testRaiseSalary(){
        Employee Anstalld1 = new Employee("Wasim Eljomaa", 42,32500);
        SystemAntslld.addEmployee(Anstalld1);
        assertEquals(1, SystemAntslld.employeeList.size());
        SystemAntslld.raiseSalary(0, 50);
        assertEquals(32500*1.5, Anstalld1.getSalary());
    }

}
