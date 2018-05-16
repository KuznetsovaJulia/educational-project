document.addEventListener('turbolinks:load', function(){
    $(document).ready(() =>
    $(function() {
        $(`.delete_block`).click(function (event) {
        event.preventDefault();
        let block_id = this.previousElementSibling.value;
        const lessonId = location.href.split(/\D+/)[2];
        if (confirm("Точно удалить?")){
            let current_block_tr = $(`tr#${block_id}`);
            console.info(current_block_tr)
            $.ajax({
                url: `/lessons/${lessonId}/blocks/${block_id}`,
                type: 'DELETE',
                success: function(){
                    $(current_block_tr).hide();
                }});
        };
        });
        $(".create_block").click(function (event) {
        event.preventDefault();
        const lessonId = location.href.split(/\D+/)[2];
        let block_theory = $("#block_theory").val();
        $.ajax({
            url: `/lessons/${lessonId}/blocks`,
            dataType: 'json',
            data: JSON.stringify({ theory: block_theory}),
            type: 'POST',
            contentType: 'application/json',
            success: function(result) {
                $(`table#blocks`).html(result);
            }
        });
    });
}))});