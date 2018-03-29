$(function () {
    const createCourseButton = $(".createCourse");
    console.log(createCourseButton);
    $(createCourseButton).click(function () {
        let name,category_ids, count = $(':checkbox:checked').length;
        if (count>=2){
            name = $("#course_name").val();
            category_ids =$(':checkbox:checked');

            $.ajax({
                url: '/create_course',
                dataType: 'json',
                data: { name: name,category_ids:category_ids },
                type: 'POST',
                success: function(data){
                    console.log(data);
                }
            });
        }
        else alert("Выберите хотя бы одну категорию");
    });

});