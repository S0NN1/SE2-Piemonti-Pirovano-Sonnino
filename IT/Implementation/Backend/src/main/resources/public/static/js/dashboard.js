$(document).ready(function () {
    if (localStorage.getItem('token') == null) {
        window.location.href = '/';
    }
    $.ajax({
        url: '/api/auth/userPing',
        method: 'GET',
        headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')},
        error: function (err) {
            if(err.status == 403) {
                window.location.href = '/';
            }
        }
    });
})

function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

if(getCookie("social-authentication")!=null && localStorage.getItem('token') == null) {
    localStorage.setItem('token', getCookie("social-authentication"));
    $.ajax({
        url: '/api/auth/me',
        method: 'GET',
        headers: {'Authorization': 'Bearer ' + localStorage.getItem('token')},
        success: function (data) {
            console.log(data);
            localStorage.setItem('username', data.username);
            window.location.href = "/dashboard";
        }
    });
}