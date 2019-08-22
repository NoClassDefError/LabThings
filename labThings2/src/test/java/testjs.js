$.ajax({
    url: "http://localhost:8080/labThings2_Web_exploded/category.action",
    data: null,
    type: "POST",
    dataType: "json",
    success: function (replacement) {
        replaceNode(str, data, replacement);
    },
    async: false
});