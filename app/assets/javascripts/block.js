$(function() {
    $(`.delete_block`).click(function (event) {
        event.preventDefault();
        let block_id = $(this).attr('id');
        if (confirm("Точно удалить?")){
            let current_block_tr = $(`tr#${block_id}`);
            $.ajax({
                url:'/delete_block/'+block_id,
                type: 'POST',
                data:{method:'DELETE'},
                success: function(){
                    $(current_block_tr).fadeOut(200);
                }
            });
        };
    });

    $(".create_block").click(function (event) {
        event.preventDefault();
        let lesson_id=$(".create_block").attr('id');
        let block_theory = $("#block_theory").val();
        $.ajax({
            url: '/create_block',
            dataType: 'json',
            data: JSON.stringify({ theory: block_theory, lesson_id:lesson_id}),
            type: 'POST',
            contentType: 'application/json',
            success: function(result) {
                $(`div#blocks`).html(result)
            }
        });

    });

});