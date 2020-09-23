window.addEventListener("DOMContentLoaded", () => {
  

    Payjp.setPublicKey("pk_test_0c46ac3895bf4185a07315a8");
    const form = document.getElementById("charge-form");
  
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);
      const card = {
        number: formData.get("card-number"),
        cvc: formData.get("card-cvc"),
        exp_month: formData.get("card-exp-month"),
        exp_year: `20${formData.get("card-exp-year")}`,
      };
      
      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
      })
    })
  })
