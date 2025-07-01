$(document).ready(function () {
    // Loan Product Selection
    $('#LoanProductX').on('change', async function () {
        const productId = $(this).val();
        console.log(productId);
        if (!productId) return;

        try {
            $.ajax({
                url: `/api/v1/loans/${productId}`,
                method: 'GET'
            })
                .done((response) => {
                    console.log(response);
                    $('#XLoanProductId').val(response.id);
                    $('#XPrincipalAmount').val(response.minPrincipalAmount);
                    $('#XDurationPeriod').val(response.durationPeriod);
                    $('#XDuration').val(response.minDurationValue);
                    $('#XInterestMethod').val(response.interestMethod);
                    $('#XInterestRate').val(response.interestRate);
                    $('#XInterestCycle').val(response.interestCycle);
                    $('#XRepaymentCycle').val(response.repaymentCycle);
                    $('#XDurationPeriod').val(response.durationPeriod);
                })
                .fail((response) => {
                    console.error(response);
                })
        } catch (err) {
            alert("Error loading loan product: " + err.message);
        }
    });
});