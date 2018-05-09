$(function() {

    $(".delete_section").click(function () {
        let $deleteSectionButton = $(".delete_section");
        if (confirm("Точно удалить?")){
            let section_id = $deleteSectionButton.val();
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
});

$(function () {
    const $createSectionButton = $(".create_section");
    let name,course_id;
    $($createSectionButton).click(function (event) {
        event.preventDefault();
        course_id=$(".create_section").attr('id');
        name = $("#section_name").val();
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
