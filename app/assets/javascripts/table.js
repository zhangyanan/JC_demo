$(function () {
    /*  searchTable隔行换色  */
    $("table.simpleTable").find("tr:first").siblings("tr:odd").addClass("blue");
});