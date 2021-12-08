$(window).on("load", function(){  
  var $buttonTransaction = $('#btn-transaction');
  var $buttonSubmit = $('#btn-submit');
  var $buttonClose = $('.btn-close');
  var $modal = $('#modal-transaction');

  var $amount = $('#transaction-amount');
  var $type = $('#transaction-type');
  var $account_data = $('#account-data');

  $buttonTransaction.on('click', function () {
    $modal.modal('show');
  })

  $buttonClose.on('click', function () {
    debugger;
    $modal.modal('hide');
  })

  $buttonSubmit.on('click', function () {
    // console.log('Amount: ' + $amount.val() + ' Transaction Type: ' + $type.val() + ' Account Id:' + $account_data.data('accountId'));
    $.ajax({
      url: '/api/v1/accounts/new_transaction',
      method: 'POST',
      dataType: 'json',
      data: {
        amount: $amount.val(),
        transaction_type: $type.val(),
        account_id: $account_data.data('accountId')
      },
      success: function(r) {
        window.location.href = window.location.href;
      },
      error: function(r) {
        var $errors = $('.alert');
        $errors.html(r.responseJSON.errors.join());
        $errors.css('display', 'block');
      }
    });
  })

});
