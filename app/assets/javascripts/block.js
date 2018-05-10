$(function() {
    $(`.delete_block`).click(function (event) {
        event.preventDefault();
        let block_id = this.previousElementSibling.value
        const lessonId = location.href.split(/\D+/)[2]
        if (confirm("Точно удалить?")){
            let current_block_tr = $(`tr#${block_id}`);
            console.info(current_block_tr)
            $.ajax({
                url: `/lessons/${lessonId}/blocks/${block_id}`,
                type: 'DELETE',
                success: function(){
                    alert('success')
                    $(current_block_tr).hide();
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