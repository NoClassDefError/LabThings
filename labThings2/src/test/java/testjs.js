var data = [{
    title: '1 江西' //一级菜单
    , children: [{
        title: '2 南昌' //二级菜单
        , children: [{
            title: '12 高新区' //三级菜单
            //…… //以此类推，可无限层级
        }]
    }]
}, {
    title: '3 陕西' //一级菜单
    , children: [{
        title: '4 西安' //二级菜单
    }]
}];

function replaceNode(son, data, replacement) {
    for (var i in data) {
        if (data[i].title.indexOf(son) !== -1) {
            console.log("replaced");
            data[i].children = replacement;
            return;
        } else try {
            if (typeof JSON.parse(data[i].children) == "object")
                replaceNode(son, data[i].children);
        } catch (e) {
        }
    }
}

replaceNode("12 ", data, 33);
console.log(data);