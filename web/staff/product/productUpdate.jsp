

<%@include file="../layout/index.jsp" %>
<div class=" container m-3 d-flex justify-content-center" style="flex-direction: column;">
    <div class="text-center">
        <h1 class="title">Update Product</h1>
    </div>
    <form id="form" action="update" method="POST"  class=" card p-3 needs-validation" novalidate   enctype="multipart/form-data">
        <input class="text-id" type="text"  value="${product.id}" name="id" hidden>
        <div class="row my-2">
            <div class="col" >
                <div class="mb-2">
                    <label  class="form-label">Name</label ><br/>
                    <input class="text-name" type="text"  value="${product.name}" required  placeholder="Name..."  name="name"/>
                    <div class="valid-feedback">
                        Valid
                    </div>
                    <div class="invalid-feedback">
                        Please input Name
                    </div>
                </div> 
                <div>
                    <label  class="form-label">Category:</label ><br/>
                    <select class="form-select form-select-sm" required aria-label=".form-select-sm example" name="categoryId">
                        <c:forEach items="${requestScope.categories}" var="o">
                            <option value="${o.id}" ${product.getCategoryId() == o.id ? "selected": "" }>${o.name}</option>     
                        </c:forEach>
                    </select>
                    <div class="valid-feedback">
                        Valid
                    </div>
                    <div class="invalid-feedback">
                        Please input Category
                    </div>
                </div>
            </div>
            <div class="col d-flex justify-content-center">
                <img src="${product.image}" width="150" height="150"  alt="${product.name}"/>
            </div>
        </div>
        <div class="row my-2">
            <div class="col">
                <label  class="form-label">Quantity</label ><br/>
                <input class="text-name" type="number" required  value="${product.getQuantity()}" placeholder="Quantity..." name="quantity" id="category-input"/>
                <div class="valid-feedback">
                    Valid
                </div>
                <div class="invalid-feedback">
                    Please input Quantity
                </div>
            </div>
            <div class="col">
                <label  class="form-label">Price</label ><br/>
                <input class="text-name" type="number" required   value="${product.getPrice()}" placeholder="Price..." name="price" id="category-input"/>
                <div class="valid-feedback">
                    Valid
                </div>
                <div class="invalid-feedback">
                    Please input Price
                </div>     
            </div>
            <div class="col" >
                <label  class="form-label">Select image:</label ><br/>
                <input type="file"  id="img" name="image" accept="image/*"> 
            </div> 
        </div>

        <div class="my-2" >
            <label  class="form-label">Description</label ><br/>
            <textarea id="id" name="description" rows="5" required class="editor" cols="10">${product.getDescription()}</textarea>
            <div class="valid-feedback">
                Valid
            </div>
            <div class="invalid-feedback">
                Please input Description
            </div>  
        </div>
        <div class="my-2" >
            <input type="submit" class="btn btn-primary" value="Create">
        </div>
    </form>
</div>
<script src="<%=request.getContextPath()%>/assets/ckeditor/ckeditor.js"></script>
<script>
    const watchdog = new CKSource.EditorWatchdog();
    window.watchdog = watchdog;
    watchdog.setCreator((element, config) => {
        return CKSource.Editor
                .create(element, config)
                .then(editor => {
                    return editor;
                })
    });
    watchdog.setDestructor(editor => {
        return editor.destroy();
    });
    watchdog.on('error', handleError);
    watchdog
            .create(document.querySelector('.editor'), {
                licenseKey: '',
            })
            .catch(handleError);
    function handleError(error) {
        console.error('Oops, something went wrong!');
        console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
        console.warn('Build id: 2ycx6bilba5o-l3dah0kel02');
        console.error(error);
    }

</script>
<script >
    (() => {
        'use strict'
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>