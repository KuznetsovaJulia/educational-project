$(function() {
    $(`.delete_lesson`).click(function (event) {
        event.preventDefault();
        let lesson_id = $(this).parent().attr('id');
        if (confirm("Точно удалить?")){
            let current_lesson_li = $(`li#${lesson_id}`);
            $.ajax({
                url:'/delete_lesson/'+lesson_id,
                type: 'POST',
                data:{method:'DELETE'},
                success: function(){
                    $(current_lesson_li).fadeOut(200);
                }
            });
        };
    });

    $(".create_lesson").click(function (event) {
        event.preventDefault();
        let section_id=$(".create_lesson").attr('id');
        let lesson_name = $("#lesson_name").val();
        $.ajax({
            url: '/create_lesson',
            dataType: 'json',
            data: JSON.stringify({ name: lesson_name, section_id:section_id}),
            type: 'POST',
            contentType: 'application/json',
            success: function(result) {
                $(`div#lessons`).html(result)
            }
        });

    });

});