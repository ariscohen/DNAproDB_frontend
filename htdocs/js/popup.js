document.addEventListener('DOMContentLoaded', function() {
    // Attach a single mouseover listener to the document
    document.addEventListener('mouseover', function(event) {
        // Check if the mouseover target or its parents have the data-popup-target attribute
        const targetElement = event.target.closest('[data-popup-target]');
        
        if (targetElement) {
            const popupId = targetElement.getAttribute('data-popup-target');
            const popup = document.getElementById(popupId);
            if (popup) {
                showPopup(popup);
            }
        }
    });

    // Attach a single mouseout listener to the document
    document.addEventListener('mouseout', function(event) {
        const targetElement = event.target.closest('[data-popup-target]');
        
        if (targetElement) {
            const popupId = targetElement.getAttribute('data-popup-target');
            const popup = document.getElementById(popupId);
            if (popup) {
                hidePopup(popup);
            }
        }
    });

    function showPopup(popup) {
        popup.style.display = 'block';
        setTimeout(() => popup.classList.add('show'), 10);
    }

    function hidePopup(popup) {
        popup.classList.remove('show');
        setTimeout(() => popup.style.display = 'none', 300);
    }
});