<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Output as HTML -->
    <xsl:output method="html" doctype-public="XSLT-compat" encoding="UTF-8" indent="yes" />

    <!-- Import CSS -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Luxury Palmeras</title>
                <link rel="stylesheet" type="text/css" href="public/style.css" />

                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                    rel="stylesheet"
                    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                    crossorigin="anonymous" />
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
                <script
                    src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
                    crossorigin="anonymous"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
                <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
                <link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png" />
                <link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png" />
                <link rel="manifest" href="site.webmanifest" />
                <link rel="mask-icon" href="safari-pinned-tab.svg" color="#5bbad5" />
                <meta name="msapplication-TileColor" content="#da532c" />
                <meta name="theme-color" content="#ffffff" />

                <!-- translate -->
                <!-- <script type="text/javascript">
                    function googleTranslateElementInit() {
                    new google.translate.TranslateElement({pageLanguage: 'nl', includedLanguages:
                    'en,es,de,fr',
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE, autoDisplay:
                    false}, 'google_translate_element');
                    }
                </script>
                <script type="text/javascript"
                    src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                <div class="sticky-top" id="google_translate_element"></div> -->
            </head>
            <body>
                <nav
                    class="navbar navbar-light navbar-expand-lg bg-white text-white pb-4 m-auto fs-4"
                    id="navigation">
                    <div class="container-fluid" id="navigation">
                        <a class="navbar-brand h3 text-black align-middle" href="index.html">
                            <img src="images/LP-icon.png"
                                class="image-responsive d-inline-block align-middle" width="40"
                                height="40" alt="Logo" /> Luxury Palmeras </a>
                        <div class="nav align-items-end px-2">
                            <button class="navbar-toggler ml-2 pl-2" type="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse " id="navbarNavDropdown">
                                <ul class="navbar-nav pull-left">
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page"
                                            href="index.html">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="Luxury invest.html">Luxury
                                            Invest</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="koopwoningen.html">Luxury
                                            Properties</a>
                                    </li>
                                    <li class="nav-item" id="menu">
                                        <a class="nav-link" href="houses.html"
                                            aria-expanded="false">Luxury Rentals</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="keyholding.html">
                                            Keyholding</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about.html">Over ons</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="row px-5">
                        <div class="col-12 text-center fw-bold m-auto pb-3">
                            <h1>Woningen te koop in Spanje</h1>
                        </div>
                    </div>
                    <!-- Dropdown for sorting -->
                    <div class="row px-5">
                        <div class="col-6 text-center fw-bold m-auto pb-3">
                            <div class="mb-3">
                                <label for="sortDropdown">Sorteer op:</label>
                                <select id="sortDropdown" class="form-control"
                                    onchange="sortProperties()">
                                    <option value="none">-- Select --</option>
                                    <option value="price_asc">Prijs (Laag naar Hoog)</option>
                                    <option value="price_desc">Prijs (Hoog naar Laag)</option>
                                    <option value="surface_area_asc">Woning Oppervlakte (Klein naar
                                        Groot)</option>
                                    <option value="surface_area_desc">Woning Oppervlakte (Groot naar
                                        Klein)</option>
                                    <option value="plot_area_asc">Tuin Oppervlakte (Klein naar
                                        Groot)</option>
                                    <option value="plot_area_desc">Tuin Oppervlakte (Groot naar
                                        Klein)</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Button filters -->
                    <div class="row px-5 fw-bold m-auto pb-3 text-center">
                        <div class="col-3">
                            <div class="mb-3">
                                <label>Filter op Slaapkamers:</label>
                                <br />
                                <button id="beds-2" class="btn btn-light"
                                    onclick="toggleFilter(this, 'beds', 2)">2 Slaapkamers</button>
                                <button id="beds-3" class="btn btn-light"
                                    onclick="toggleFilter(this, 'beds', 3)">3 Slaapkamers</button>
                                <button id="beds-4" class="btn btn-light"
                                    onclick="toggleFilter(this, 'beds', 4)">4 Slaapkamers</button>
                                <br />
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label>Filter op Badkamer:</label>
                                <br />
                                <button id="baths-1" class="btn btn-light"
                                    onclick="toggleFilter(this, 'baths', 1)">1 Badkamer</button>
                                <button id="baths-2" class="btn btn-light"
                                    onclick="toggleFilter(this, 'baths', 2)">2 Badkamer</button>
                                <button id="baths-3" class="btn btn-light"
                                    onclick="toggleFilter(this, 'baths', 3)">3 Badkamer</button>
                                <br />
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label>Filter op Zwembaden:</label>
                                <br />
                                <button id="pool-1" class="btn btn-light"
                                    onclick="toggleFilter(this, 'pool', 1)">Met Zwembad</button>
                                <button id="pool-0" class="btn btn-light"
                                    onclick="toggleFilter(this, 'pool', 0)">Zonder Zwembad</button>
                                <br />
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="mb-3">
                                <label>Filter op type woning:</label>
                                <br />
                                <button id="type-Villa" class="btn btn-light"
                                    onclick="toggleFilter(this, 'type', 'Villa')">Villa</button>
                                <button id="type-Apartment" class="btn btn-light"
                                    onclick="toggleFilter(this, 'type', 'Apartment')">Appartement</button>
                                <br />
                            </div>
                        </div>
                    </div>
                    <div class="row px-5 fw-bold m-auto pb-3 text-center">
                        <div class="col-12">
                            <div class="mb-12">
                                <button class="btn btn-secondary mt-2" onclick="clearFilters()">Reset
                                    Filters</button>
                            </div>
                        </div>
                    </div>
                    <div id="property-list"
                        class="row row-cols-lg-3 row-cols-md-1 row-cols-1 g-5 p-5">
                        <xsl:apply-templates select="//property" />
                    </div>
                </div>
                <!-- contact form -->

                <div class="modal fade" id="verstuurd" aria-hidden="true"
                    aria-labelledby="verstuurd" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="verstuurd">Bedankt!</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Uw ontvangt spoeding een reactie van ons.
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer sticky-bottom">
                    <!-- contact -->
                    <div class="container-fluid px-5 bg-body">
                        <div class="row g-3 mx-auto">
                            <!-- <div class="col-12 text-center">
                                <h1>Contact</h1>
                            </div> -->
                            <div class="col-lg-2 col-md-4 col-6 mx-auto text-center">
                                <a class="text-decoration-none text-body fw-bold" target="_blank"
                                    href="https://g.co/kgs/XPHsQeV">
                                    <i class="bi bi-geo-alt-fill h3"></i>
                                    <p>Carrer de Germanies 10
                                        03111 Busot Alicante, Spain </p>
                                </a>
                            </div>
                            <div class="col-lg-2 col-md-4 col-6 m-auto text-center">
                                <a class="text-decoration-none text-body fw-bold" target="_blank"
                                    href="https://wa.me/+31651717024">
                                    <i class="bi bi-whatsapp h3"></i>
                                    <p>+31651717024</p>
                                </a>
                            </div>
                            <div class="col-lg-2 col-md-4 col-6 m-auto text-center">
                                <a class="text-decoration-none text-body fw-bold" target="_blank"
                                    href="https://www.linkedin.com/company/luxury-palmeras/">
                                    <i class="bi bi-linkedin h3"></i>
                                    <p>LinkedIn</p>
                                </a>
                            </div>
                            <div class="col-lg-2 col-md-4 col-6 m-auto text-center">
                                <a class="text-decoration-none text-body fw-bold" target="_blank"
                                    href="" data-bs-toggle="modal"
                                    data-bs-target="#modalContactForm">
                                    <i class="bi bi-envelope-at-fill h3"></i>
                                    <p>Mike@Luxurypalmeras.com</p>
                                </a>
                            </div>
                            <div class="col-lg-2 col-md-4 col-6 m-auto text-center">
                                <a class="text-decoration-none text-body fw-bold" target="_blank"
                                    href="https://www.facebook.com/profile.php?id=100094585713462">
                                    <i class="bi bi-facebook h3"></i>
                                    <p>@luxury Palmeras</p>
                                </a>
                            </div>
                            <div class="col-lg-2 col-md-4 col-6 m-auto text-center">
                                <a class="text-decoration-none text-body fw-bold" target="_blank"
                                    href="https://www.instagram.com/luxurypalmeras/">
                                    <i class="bi bi-instagram h3"></i>
                                    <p>@luxurypalmeras</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- Script for sorting properties -->
                <script>
                    let currentFilter = {};

                    window.onload = function() {
                    document.getElementById('sortDropdown').addEventListener('change',
                    sortProperties);
                    };

                    function sortProperties() {
                    var propertyList = document.getElementById('property-list');
                    var properties = Array.from(propertyList.getElementsByClassName('property'));
                    var sortBy = document.getElementById('sortDropdown').value;
                    properties.sort(function(a, b) {
                    var comparison = 0;
                    if (sortBy === 'price_asc') {
                    comparison = parseInt(a.getAttribute('data-price')) -
                    parseInt(b.getAttribute('data-price'));
                    } else if (sortBy === 'price_desc') {
                    comparison = parseInt(b.getAttribute('data-price')) -
                    parseInt(a.getAttribute('data-price'));
                    } else if (sortBy === 'surface_area_asc') {
                    comparison = parseInt(a.getAttribute('data-surface-area')) -
                    parseInt(b.getAttribute('data-surface-area'));
                    } else if (sortBy === 'surface_area_desc') {
                    comparison = parseInt(b.getAttribute('data-surface-area')) -
                    parseInt(a.getAttribute('data-surface-area'));
                    } else if (sortBy === 'plot_area_asc') {
                    comparison = parseInt(a.getAttribute('data-plot-area')) -
                    parseInt(b.getAttribute('data-plot-area'));
                    } else if (sortBy === 'plot_area_desc') {
                    comparison = parseInt(b.getAttribute('data-plot-area')) -
                    parseInt(a.getAttribute('data-plot-area'));
                    }
                    return comparison;
                    });

                    // Re-arrange properties in the DOM
                    properties.forEach(function(property) {
                    propertyList.appendChild(property);
                    });
                    }

                    function toggleFilter(button, attribute, value) {
                    // Clear previous selection for this filter category
                    let buttons = document.querySelectorAll(`button[id^=${attribute}]`);
                    buttons.forEach(function(btn) {
                    btn.classList.remove('btn-secondary');
                    btn.classList.add('btn-light');
                    });

                    // Set the clicked button as active
                    button.classList.toggle('btn-secondary');
                    button.classList.toggle('btn-light');

                    currentFilter[attribute] = value;

                    filterProperties();
                    }

                    function filterProperties() {
                    var properties = document.getElementsByClassName('property');
                    Array.from(properties).forEach(function(property) {
                    let showProperty = true;

                    for (let [attribute, value] of Object.entries(currentFilter)) {
                    let propertyValue = property.getAttribute('data-' + attribute);

                    if (attribute === 'type') {
                    if (propertyValue !== value) {
                    showProperty = false;
                    break;
                    }
                    } else if (parseInt(propertyValue) !== value) {
                    showProperty = false;
                    break;
                    }
                    }

                    property.style.display = showProperty ? 'block' : 'none';
                    });
                    }

                    function clearFilters() {
                    var properties = document.getElementsByClassName('property');
                    Array.from(properties).forEach(function(property) {
                    property.style.display = 'block';
                    });

                    currentFilter = {}; // Clear the active filters

                    // Reset button styles
                    let buttons = document.querySelectorAll('button.btn-secondary');
                    buttons.forEach(function(btn) {
                    btn.classList.remove('btn-secondary');
                    btn.classList.add('btn-light');
                    });
                    }
                </script>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each property -->
    <xsl:template match="property">
        <div class="property" data-price="{price}" data-surface-area="{surface_area/built}"
            data-plot-area="{surface_area/plot}" data-beds="{beds}" data-baths="{baths}"
            data-pool="{pool}" data-type="{type}">
            <div class="col">
                <div class="card h-100">
                    <div id="{ref}" class="carousel slide carousel-fade card-img-top"
                        data-bs-ride="carousel">
                        <div class="carousel-inner" data-bs-ride="carousel">
                            <xsl:for-each select="images/image[1]">
                                <div class="carousel-item active" data-bs-interval="3000"
                                    data-bs-ride="carousel">
                                    <img class="d-block w-100 rounded-top" src="{url}"
                                        alt="Property Image" id="casa1" />
                                </div>
                            </xsl:for-each>
                            <xsl:for-each select="images/image[position()>1]">
                                <div class="carousel-item" data-bs-interval="3000"
                                    data-bs-ride="carousel">
                                    <img class="d-block w-100 rounded-top" src="{url}"
                                        alt="Property Image" id="casa1" />
                                </div>
                            </xsl:for-each>
                        </div>
                        <button class="carousel-control-prev" type="button"
                            data-bs-target="#{ref}" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button"
                            data-bs-target="#{ref}" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <div class="card-body text-center">
                        <h4 class="card-title"><xsl:value-of select="type" /> in <xsl:value-of
                                select="town" />, <xsl:value-of
                                select="province" />
                        </h4>
                        <h5>Prijs: <xsl:value-of select="price" />.- <xsl:value-of
                                select="currency" />
                        </h5>
                        <ul class="h6 list-unstyled">
                            <li><xsl:value-of select="beds" /> Slaapkamers</li>
                            <li><xsl:value-of select="baths" /> Badkamers</li>
                            <li><xsl:value-of select="pool" /> Zwembad</li>
                            <li><xsl:value-of select="surface_area/built" /> m2 Woning Oppervlakte</li>
                            <li><xsl:value-of select="surface_area/plot" /> m2 Tuin Oppervlakte</li>
                            <li><xsl:value-of select="energy_rating/consumption" /> Energie Label</li>
                        </ul>
                    </div>
                    <div class="card-text text-center align-items-end pb-3">
                        <button type="button" class="btn btn-outline-secondary"
                            data-bs-toggle="modal"
                            data-bs-target="#{ref}imageModal">
                            Meer informatie
                        </button>
                    </div>
                </div>

                <!-- Bootstrap Modal Structure -->
                <div class="modal modal-xl fade" id="{ref}imageModal" aria-hidden="true"
                    aria-labelledby="{ref}imageModalLabel" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5 fw-bold"
                                    id="{ref}imageModalLabel">
                                    <xsl:value-of select="type" /> in <xsl:value-of
                                        select="town" />, <xsl:value-of
                                        select="province" />
                                </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="{ref}inModal"
                                    class="carousel slide carousel-fade card-img-top"
                                    data-bs-ride="carousel">
                                    <div class="carousel-inner" data-bs-ride="carousel">
                                        <xsl:for-each select="images/image[1]">
                                            <div class="carousel-item active"
                                                data-bs-interval="5000"
                                                data-bs-ride="carousel">
                                                <img class="d-block w-100 rounded-top" src="{url}"
                                                    alt="Property Image" loading="lazy" id="casa1" />
                                            </div>
                                        </xsl:for-each>
                                        <xsl:for-each select="images/image[position()>1]">
                                            <div class="carousel-item" data-bs-interval="5000"
                                                data-bs-ride="carousel">
                                                <img class="d-block w-100 rounded-top" src="{url}"
                                                    alt="Property Image" loading="lazy" id="casa1" />
                                            </div>
                                        </xsl:for-each>
                                    </div>
                                    <button class="carousel-control-prev" type="button"
                                        data-bs-target="#{ref}inModal" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button"
                                        data-bs-target="#{ref}inModal" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                                <div class="text-center m-auto pb-3">
                                    <div class="row">
                                        <h4 class="fw-bold">Prijs: <xsl:value-of select="price" />.- <xsl:value-of
                                                select="currency" />
                                        </h4>
                                    </div>
                                    <div class="row pb-3">
                                        <h4 class="fw-bold">Omschrijving</h4>
                                        <xsl:value-of
                                            select="desc/nl" disable-output-escaping="yes" />
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <h4 class="fw-bold">Kamers en oppervlakte</h4>
                                        </div>
                                        <div class="col">
                                            <h4 class="fw-bold">Hoogtepunten</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <ul class="h5 list-unstyled">
                                                <li><xsl:value-of select="beds" /> Slaapkamers </li>
                                                <li><xsl:value-of select="baths" /> Badkamers</li>
                                                <li><xsl:value-of select="pool" /> Zwembdad</li>
                                                <li><xsl:value-of select="surface_area/built" /> m2
                                                    Oppervlakte</li>
                                                <li><xsl:value-of select="surface_area/plot" /> m2
                                                    Tuin Oppervlakte</li>
                                                <li><xsl:value-of select="energy_rating/consumption" />
                                                    Energie Label</li>
                                            </ul>
                                        </div>
                                        <div class="col">
                                            <ul class="h5 list-unstyled">
                                                <xsl:for-each select="features/feature">
                                                    <li>
                                                        <xsl:value-of select="." />
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center m-auto pb-3">
                                    <button class="btn btn-outline-secondary text-center m-auto"
                                        data-bs-target="#{ref}modalContactForm"
                                        data-bs-toggle="modal">Neem contact met ons op!</button>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <p class="fs-6 text-start">In samenwerking met Gaudi Estate.
                                    Register van makelaars in onroerend goed:
                                    Valenciaanse Gemeenschap (RAICV) nr. 2714</p>
                                <img src="images/gaudi_logo_hr-1.png"
                                    class="image-responsive d-inline-block" width="40"
                                    height="40" alt="Logo" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- contact form -->
                <div class="modal fade" id="{ref}modalContactForm" tabindex="-1" role="dialog"
                    aria-labelledby="myModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header text-center">
                                <h4 class="modal-title w-100 font-weight-bold">Bericht ons!</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <form class="needs-validation" id="contactFormHousing"
                                onsubmit="validateContactForm()" method="POST"
                                name="myEmailFormHousing"
                                action="https://formspree.io/f/manyypgq">
                                <div class="modal-body mx-3">
                                    <div class="md-form mb-3">
                                        <i class="fas fa-user prefix grey-text"></i>
                                        <label data-error="wrong" data-success="right" for="form34">
                                            Uw
                                            naam</label>
                                        <input type="text" id="form34" class="form-control validate"
                                            name="name" />
                                    </div>
                                    <div class="md-form mb-3">
                                        <i class="fas fa-envelope prefix grey-text"></i>
                                        <label data-error="wrong" data-success="right" for="form29">
                                            Uw
                                            email address</label>
                                        <input type="email" id="form29"
                                            class="form-control validate"
                                            aria-describedby="emailHelp" name="email" />
                                        <div id="emailHelp" class="form-text">Wij delen u email niet
                                            met derden.</div>
                                    </div>
                                    <div class="md-form mb-3">
                                        <i class="fas fa-tag prefix grey-text"></i>
                                        <label data-error="wrong" data-success="right"
                                            for="email-subject">Onderwerp</label>
                                        <input type="text" id="email-subject"
                                            class="form-control validate" name="email-subject"
                                            value="Info {type} in {town}, {province} ({ref})" />
                                    </div>
                                    <div class="md-form mb-3">
                                        <input type="hidden" id="house-ref" name="house-ref"
                                            value="Info {type} in {town}, {province} ({ref})" />
                                    </div>
                                    <div class="md-form">
                                        <i class="fas fa-pencil prefix grey-text"></i>
                                        <label data-error="wrong" data-success="right" for="form8">Uw
                                            bericht:</label>
                                        <textarea type="text" id="form8"
                                            class="md-textarea form-control" rows="4" name="message"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer d-flex justify-content-center">
                                    <button type="submit" class="btn btn-dark"
                                        onclick="validateContactForm()" data-bs-target="#verstuurd"
                                        value="send">Verstuur <i class="fas fa-paper-plane-o ml-1"></i></button>
                                </div>
                                <div class="modal fade" id="verstuurd" aria-hidden="true"
                                    aria-labelledby="verstuurd" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="verstuurd">Bedankt!</h5>
                                                <button type="button" class="btn-close"
                                                    data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                Bedankt voor u bericht!
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>