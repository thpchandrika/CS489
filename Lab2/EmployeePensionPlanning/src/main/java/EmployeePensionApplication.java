import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class EmployeePensionApplication {
    public static void main(String[] args){

        List<Employee> employeeList = new ArrayList<>();

        Employee e1 = new Employee(1L, "Daniel", "Agar", LocalDate.of(2018,1, 17),
                105945.50);
        PensionPlan p1 = new PensionPlan("EX1089", LocalDate.of(2023,1,17),
                100);
        e1.setPensionPlan(p1);

        Employee e2 = new Employee(2L, "Benard", "Shaw", LocalDate.of(2019,4, 3),
                197750.00);

        Employee e3 = new Employee(3L, "Carly", "Agar", LocalDate.of(2014,5, 16),
                197750.00);

        PensionPlan p3 = new PensionPlan("SM2307", LocalDate.of(2019,11,4),
                1555.50);

        e3.setPensionPlan(p3);

        Employee e4 = new Employee(4L, "Wesley", "Schneider", LocalDate.of(2019,5, 2),
                74500.00);

        employeeList.add(e1);
        employeeList.add(e2);
        employeeList.add(e3);
        employeeList.add(e4);

        employeeList.sort(Comparator.comparing(Employee::getLastName).thenComparing(Comparator.comparing(Employee::getYearlySalary).reversed()));
        showAllEmployees(employeeList);
        showMonthlyUpcomingEnrolles(employeeList);
    }

    public static void showAllEmployees(List<Employee> employees){
        System.out.println("List of all the Employees");
        System.out.println("==========================================================================");
        System.out.println("[");
        for (Employee emp : employees){
            System.out.println(emp.toJSONString());
            if (emp.getPensionPlan() != null){
                System.out.println(emp.getPensionPlan().toJSONString());
            }
        }
        System.out.println("]");
    }

    public static void showMonthlyUpcomingEnrolles(List<Employee> employees){
        System.out.println("Monthly Upcoming Enrollees report");
        System.out.println("========================================================================");

        LocalDate today = LocalDate.now();
        LocalDate firstDayOfNextMonth = today.plusMonths(1).withDayOfMonth(1);
        LocalDate lastDayOfNextMonth = firstDayOfNextMonth.plusMonths(1).minusDays(1);

        System.out.println("[");
        employees.stream()
                .filter(emp -> emp.getPensionPlan() == null
                        &&  emp.getEmploymentDate().plusYears(5).isBefore(lastDayOfNextMonth)
                        &&  emp.getEmploymentDate().plusYears(5).isAfter(firstDayOfNextMonth)

                )
                .sorted(Comparator.comparing(Employee::getEmploymentDate))
                .forEach(emp -> System.out.println(emp.toJSONString()));
        System.out.println("]");
    }


}
