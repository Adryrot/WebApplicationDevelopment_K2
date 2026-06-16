# TODO - DriveSmart Integrated Academy (MVC Prototype)

## Database
- [x] Create `db_setup.sql` with MySQL commands for `drivesmart_db` and table `Training_Sessions`.


## Model
- [x] Create `src/java/model/SessionBean.java` (JavaBean).


## DAO
- [x] Create `src/java/dao/SessionDAO.java` with:

  - [x] JDBC connection method
  - [x] `bookSession(SessionBean session)` INSERT
  - [x] `getAllSessions()` SELECT ordered by `branch_location`

## Controllers (Servlets)
- [x] Create `src/java/controller/BookSessionServlet.java` (doPost insert + redirect)
- [x] Create `src/java/controller/ScheduleServlet.java` (doGet load list + forward)

## Views (JSP)
- [x] Create `web/book_session.jsp` booking form
- [x] Create `web/schedule.jsp` table rendering `sessionList`

## Shared UI
- [x] Create `web/header.html`
- [x] Create `web/footer.jsp` (dynamic server datetime)
- [x] Create `web/index.jsp` with `<%@ include %>` of header/footer and navigation links

## Web routing
- [x] Create `web/WEB-INF/web.xml` mapping servlets to URL patterns

## Testing
- [ ] Start Tomcat/NetBeans server and verify booking -> schedule flow works
- [ ] Verify schedule table shows centralized data from DB

