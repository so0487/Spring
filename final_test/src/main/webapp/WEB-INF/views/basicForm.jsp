<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!doctype html>
<html class="no-js" lang="en">

            <div class="row">

                <!--Form controls Start-->
                <div class="col-12 mb-30">
                    <div class="box">
                        <div class="box-head">
                            <h3 class="title">Form controls</h3>
                        </div>
                        <div class="box-body">
                            <div class="row mbn-20">

                                <!--Form Field-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Default</h6>

                                    <div class="row mbn-15">
                                        <div class="col-12 mb-15"><input type="text" class="form-control" placeholder="Input"></div>
                                        <div class="col-12 mb-15">
                                            <select class="form-control">
                                                <option>Select</option>
                                                <optgroup label="Options One">
                                                    <option>One</option>
                                                    <option>Two</option>
                                                    <option>Three</option>
                                                </optgroup>
                                                <optgroup label="Options Two">
                                                    <option>One</option>
                                                    <option>Two</option>
                                                    <option>Three</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-15"><textarea class="form-control" placeholder="Textarea"></textarea></div>
                                    </div>

                                </div>
                                <!--Form Field-->

                                <!--Readonly Field-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Readonly</h6>

                                    <div class="row mbn-15">
                                        <div class="col-12 mb-15"><input type="text" class="form-control" readonly placeholder="Readonly Input"></div>
                                        <div class="col-12 mb-15">
                                            <select class="form-control">
                                                <option>Readonly Select</option>
                                                <optgroup label="Options One">
                                                    <option disabled>One</option>
                                                    <option disabled>Two</option>
                                                    <option disabled>Three</option>
                                                </optgroup>
                                                <optgroup label="Options Two">
                                                    <option disabled>One</option>
                                                    <option disabled>Two</option>
                                                    <option disabled>Three</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-15"><textarea class="form-control" readonly placeholder="Readonly Textarea"></textarea></div>
                                    </div>

                                </div>
                                <!--Readonly Field-->

                                <!--Disabled Field-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Disabled</h6>

                                    <div class="row mbn-15">
                                        <div class="col-12 mb-15"><input type="text" class="form-control" disabled placeholder="Disabled Input"></div>
                                        <div class="col-12 mb-15">
                                            <select class="form-control" disabled>
                                                <option>Disabled Select</option>
                                                <optgroup label="Options One">
                                                    <option disabled>One</option>
                                                    <option disabled>Two</option>
                                                    <option disabled>Three</option>
                                                </optgroup>
                                                <optgroup label="Options Two">
                                                    <option disabled>One</option>
                                                    <option disabled>Two</option>
                                                    <option disabled>Three</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="col-12 mb-15"><textarea class="form-control" disabled placeholder="Disabled Textarea"></textarea></div>
                                    </div>

                                </div>
                                <!--Disabled Field-->

                            </div>
                        </div>
                        <div class="box-foot">
                            <p>Textual form controls—like inputs, selects, and textareas—are styled with the <code>.form-control</code> class. Included are styles for general appearance, focus state, sizing, and more.</p>
                        </div>
                    </div>
                </div>
                <!--Form controls End-->

                <!--Other Default Elements Start-->
                <div class="col-12">
                    <div class="box">
                        <div class="box-head">
                            <h3 class="title">Other Default Elements</h3>
                        </div>
                        <div class="box-body">
                            <div class="row mbn-20">

                                <!--Multiple Select-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Multiple Select</h6>

                                    <select class="form-control" multiple>
                                        <option>One</option>
                                        <option>Two</option>
                                        <option>Three</option>
                                        <option>Four</option>
                                        <option>Five</option>
                                    </select>

                                </div>
                                <!--Multiple Select-->

                                <!--File Input-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">File Input</h6>

                                    <input type="file" class="form-control">

                                </div>
                                <!--File Input-->

                                <!--Input Range-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Range</h6>

                                    <input type="range" class="form-control-range">

                                </div>
                                <!--Input Range-->

                                <!--Checkbox-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Checkbox</h6>

                                    <label><input type="checkbox">Default checkbox</label>
                                    <label><input type="checkbox" disabled>Checkbox Disabled</label>

                                </div>
                                <!--Checkbox-->

                                <!--Radio-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Radio</h6>

                                    <label><input type="radio" name="basicRadio">Default Radio</label>
                                    <label><input type="radio" name="basicRadio">Another Default Radio</label>
                                    <label><input type="radio" name="basicRadio" disabled>Radio Disabled</label>

                                </div>
                                <!--Radio-->

                                <!--Inline Checkbox & Radio-->
                                <div class="col-lg-4 col-12 mb-20">

                                    <h6 class="mb-15">Inline Checkbox & Radio</h6>

                                    <div class="form-group">
                                        <label class="inline"><input type="checkbox">One</label>
                                        <label class="inline"><input type="checkbox">Two</label>
                                    </div>

                                    <div class="form-group">
                                        <label class="inline"><input type="radio" name="inlineBasicRadio">One</label>
                                        <label class="inline"><input type="radio" name="inlineBasicRadio">Two</label>
                                    </div>

                                </div>
                                <!--Inline Checkbox & Radio-->

                            </div>
                        </div>
                    </div>
                </div>
                <!--Other Default Elements End-->

            </div>



</html>