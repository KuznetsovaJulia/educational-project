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

const coursesApp = {}

coursesApp.main = {
    handleSearchButtonsClick(){
      const $searchByCategoryButton = $('.courses__search_by_category')
      const $searchByName = $('.courses__search_by_name')
      const $searchByCategoryBody = $('.courses__category_search--input')
      const $searchByNameBody = $('.courses__name_search--input')
      $searchByCategoryButton.click((e) => {
          e.preventDefault();
          $($searchByName).show()
          $($searchByCategoryBody).show()
          $($searchByNameBody).hide()
          $($searchByCategoryButton).hide()

      })
    }
};

coursesApp.init = function () {
    coursesApp.main.handleSearchButtonsClick()
}

coursesApp.init();