$(function () {
    const $createCourseButton = $(".create_course");
    $($createCourseButton).click(function () {
        let name,category_names, count = $(":checkbox:checked").length;
        if (count>=2){
            name = $("#course_name").val();
            category_names =$("input:checked").valList();

            $.ajax({
                url: '/create_course',
                dataType: 'json',
                data: JSON.stringify({ name: name,category_names:category_names }),
                type: 'POST',
                contentType: 'application/json',
                success: function() { }
            });
        }
        else alert("Выберите хотя бы одну категорию");
    });

    $(function(){
        $.fn.valList = function(){
            return $.map( this, function (elem) {
                return elem.value || "";
            }).join( " " );
        };
    });

});