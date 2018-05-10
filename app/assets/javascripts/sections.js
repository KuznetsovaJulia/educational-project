$(function() {
    $(`.delete_section`).click(function (event) {
        event.preventDefault();
        let section_id = $(this).attr('id');
        if (confirm("Точно удалить?")){
            let current_section_tr = $(`tr#${section_id}`);
            $.ajax({
                url:'/delete_section/'+section_id,
                type: 'POST',
                data:{method:'DELETE'},
                success: function(){
                    $(current_section_tr).fadeOut(200);
                }
            });
        };
    });

    $(".create_section").click(function (event) {
        event.preventDefault();
        let course_id=$(".create_section").attr('id');
        let name = $("#section_name").val();
        $.ajax({
            url: '/create_section',
            dataType: 'json',
            data: JSON.stringify({ name: name, course_id:course_id}),
            type: 'POST',
            contentType: 'application/json',
            success: function(result) {
                $("#sections").html(result)
            }
        });
    });
});
