import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class EmployeeTest {

    Employee Anstalld1 = new Employee("Wasim Eljomaa", 42, 32500);
    Employee Anstalld2 = new Employee("Eva Freih", 40, 55000);


    @Test
    void testEmployee(){
        assertEquals("Wasim Eljomaa", Anstalld1.EmployeeName);
        assertEquals(42, Anstalld1.EmployeeAge);
        assertEquals(32500, Anstalld1.EmployeeSalary);
        assertNotNull(Anstalld1.EmployeeId);

    }

    @Test
    void testEmployeeName(){

        Anstalld1.getName();
        assertEquals("Wasim Eljomaa", Anstalld1.getName());

        Anstalld1.setName("Eva Freih");
        assertEquals("Eva Freih", Anstalld2.getName());
    }
    @Test
    void testEmployeeAge(){
        Anstalld1.getAge();
        assertEquals(42, Anstalld1.getAge());

        Anstalld1.setAge(40);
        assertEquals(40, Anstalld1.getAge());
    }

    @Test
    void testEmployeeSalary(){
        Anstalld1.getSalary();
        assertEquals(32500, Anstalld1.getSalary());

        Anstalld1.setSalary(29000);
        assertEquals(29000, Anstalld1.getSalary());
    }

    @Test
    void testEmployeeId(){

        Anstalld1.getId();
        assertNotNull( Anstalld1.getId());

        assertTrue(Anstalld1.getId() != Anstalld2.getId());

        Anstalld1.setId(10);
        assertEquals(10, Anstalld1.getId());

    }
    //VG delen
    @Test
    void TestRaiseSalary(){
        assertEquals(32500, Anstalld1.getSalary());
        Anstalld1.raiseSalary(100);
        assertEquals(32500*2, Anstalld1.getSalary());
    }
}
