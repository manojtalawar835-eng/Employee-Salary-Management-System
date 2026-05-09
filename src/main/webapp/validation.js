/* ============================================
   Employee Management System - Validation Logic
   ============================================ */

document.addEventListener('DOMContentLoaded', function() {
    const forms = document.querySelectorAll('form');

    forms.forEach(form => {
        form.addEventListener('submit', function(event) {
            let isValid = true;
            const inputs = form.querySelectorAll('input[required], select[required]');

            inputs.forEach(input => {
                // Basic empty check
                if (!input.value.trim()) {
                    showError(input, "This field is required");
                    isValid = false;
                } else {
                    removeError(input);
                }

                // Salary specific check
                if (input.name === 'salary' || input.id === 'salary') {
                    if (isNaN(input.value) || parseFloat(input.value) <= 0) {
                        showError(input, "Please enter a valid salary amount");
                        isValid = false;
                    }
                }
            });

            if (!isValid) {
                event.preventDefault(); // Stop form from submitting
            }
        });
    });
});

function showError(input, message) {
    input.style.borderColor = "#ef4444"; // Danger color
    console.error("Validation error on " + input.name + ": " + message);
}

function removeError(input) {
    input.style.borderColor = "#22c55e"; // Success color
}