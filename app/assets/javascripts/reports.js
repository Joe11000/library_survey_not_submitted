$(() => {
  const $add_record_button = $('[data-id="add_record_button"]');
  
  if($add_record_button.length != 0) {
    // add record to form
    $add_record_button.on('click', (e) => {
      e.preventDefault();
      
      let template_html = $("template").html()
      $("[data-id='records']").append(template_html)
    })

    $add_record_button.click();
    
    // delete local record from form (if more than one exists)
    $('form').on('click', "[data-class='delete-record-button']", (e) => {
      e.preventDefault();
      
      if($("[data-id='new-record'] fieldset").length > 1) {
        e.target.closest('fieldset').remove();
      }
    })
  }
})