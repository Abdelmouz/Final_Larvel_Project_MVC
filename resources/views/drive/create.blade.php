@extends('layouts.app')
@section('content')
    <div class="container col-8">
        @if (Session::has('done'))
            <div class="alert alert-primary mx-auto col-6" role="alert">
                {{ Session::get('done') }}
            </div>
        @endif
        <h3 class="text-center text-info  p-2 rade-5">Post Drive</h3>
        <div class="card  m-auto mt-5">
            <div class="card-body">
                <form method="post" action="{{ route('drive.store') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group mb-2">
                        <label>File Title :</label>
                        <input class="form-control" type="text"name="title">
                        @error('title')
                            <div class="alert alert-danger mx-auto " role="alert">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <div class="form-group mb-2">
                        <label>File Description :</label>
                        <input class="form-control" type="text"name="description">
                        @error('description')
                            <div class="alert alert-danger mx-auto " role="alert">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <div class="form-group mb-2">
                        <label>Choesse File :</label>
                        <input class="form-control" type="file"name="yourfile">
                        @error('yourfile')
                            <div class="alert alert-danger mx-auto " role="alert">
                                {{ $message }}
                            </div>
                        @enderror
                    </div>
                    <button class="btn btn-dark mt-3 w-100">Upload File</button>
                </form>
            </div>
        </div>
    </div>
@endsection
