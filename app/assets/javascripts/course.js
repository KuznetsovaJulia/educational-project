$(function ($) {
    const $createCourseButton = $('.create_course');
    console.log($createCourseButton);
    $createCourseButton.click(function () {
        let name;
        name = $("#course[name]").val();
        $.ajax({
            url: '/create_course',
            dataType: 'json',
            data: { name: name},
            type: 'POST',
            success: function(data){
                console.log(data);
            }
        });
    });

});