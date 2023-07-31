function submitForm(input) {
  if (input.files && input.files[0]) {
    const form = input.closest('form');
    form.submit();
  }
}