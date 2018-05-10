$(function() {
    $(`.delete_practice`).click(function (event) {
        event.preventDefault();
        let practice_id = $(this).parent().attr('id');
        if (confirm("Точно удалить?")){
            let current_practice_li = $(`li#${practice_id}`);
            $.ajax({
                url:'/delete_practice/'+practice_id,
                type: 'POST',
                data:{method:'DELETE'},
                success: function(){
                    $(current_practice_li).fadeOut(200);
                }
            });
        };
    });

    $(".create_practice").click(function (event) {
        event.preventDefault();
        let block_id = location.href.split(/\D+/)[2];
        let question = $("#practice_question").val();
        let answer_type=$("#practice_answer_type").val();
        $.ajax({
            url: '/create_practice',
            dataType: 'json',
            data: JSON.stringify({ question: question, block_id:block_id,answer_type:answer_type}),
            type: 'POST',
            contentType: 'application/json',
            success: function(result) {
                $(`div#practices`).html(result)
            }
        });

    });

});