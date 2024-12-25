<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link href="static/main.css" rel="stylesheet">
    <%--- это объявление библиотеки тегов JSTL (JavaServer Pages Standard Tag Library).--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>


</head>
<body>
<h1>Tic-Tac-Toe</h1>

<table>
    <%--Давай каждому тегу “d” добавим параметр “onclick”. В значении укажем смену текущей страницы на указанный URL. Сервлет, который будет отвечать за логику, будет иметь URL “/logic”. И будет принимать параметр с названием “click”. Так будем передавать индекс ячейки, по которой кликнул пользователь. --%>
    <tr>
        <td onclick="window.location='/logic?click=0'">${data.get(0).getSign()}</td>
        <td onclick="window.location='/logic?click=1'">${data.get(1).getSign()}</td>
        <td onclick="window.location='/logic?click=2'">${data.get(2).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=3'">${data.get(3).getSign()}</td>
        <td onclick="window.location='/logic?click=4'">${data.get(4).getSign()}</td>
        <td onclick="window.location='/logic?click=5'">${data.get(5).getSign()}</td>
    </tr>
    <tr>
        <td onclick="window.location='/logic?click=6'">${data.get(6).getSign()}</td>
        <td onclick="window.location='/logic?click=7'">${data.get(7).getSign()}</td>
        <td onclick="window.location='/logic?click=8'">${data.get(8).getSign()}</td>
    </tr>
</table>

<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<%-- test= - атрибут тега <c:if>, который принимает условное выражение
    ${} - обязательные символы для обозначения EL-выражения. Внутри фигурных скобок размещается само выражение
    Компоненты выражения:
    winner - это атрибут, который ищется в следующем порядке:
        pageScope (область видимости страницы)
        requestScope (область видимости запроса)
        !!!sessionScope (область видимости сессии)!!!
        applicationScope (область видимости приложения)
    == - оператор сравнения в EL
    NOUGHTS - переменная, определенная через <c:set> --%>

<c:if test="${winner == CROSSES}">
    <h1>CROSSES WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>
<c:if test="${winner == NOUGHTS}">
    <h1>NOUGHTS WIN!</h1>
    <button onclick="restart()">Start again</button>
</c:if>

<c:if test="${draw}">
    <h1>IT'S A DRAW</h1>
    <br>
    <button onclick="restart()">Start again</button>
</c:if>


<script>
    /*В “index.jsp” в секции “script” добавим функцию, которая умеет оправлять POST запрос на сервер.
    Функцию сделаем синхронной, и когда придет ответ с сервера – перезагрузит текущую страницу. */
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>