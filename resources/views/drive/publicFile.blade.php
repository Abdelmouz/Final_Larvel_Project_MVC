@extends('layouts.app')
@section('content')
    <div class="container">
        @if (Session::has('done'))
            <div class="alert alert-info mx-auto col-6" role="alert">
                {{ Session::get('done') }}
            </div>
        @endif
        <div class="container col-8">
            <h1 class="text-center text-info  p-2 rade-5">Public Drive</h1>
            @forelse ($data_file as $datafiles)
                <div class="card mx-auto mt-3 cardFile">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="{{ asset('image/file.png') }}" alt="">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body mb-1 ">
                                <h5 class="card-title mb-3">{{ $datafiles->title }}</h5>
                                <p class="card-text">{{ $datafiles->description }}.</p>
                                <h6 class="card-text mb-2">Auther : {{ $datafiles->NameUser }}</h6>
                                <h6 class="card-text">Email : {{ $datafiles->Email }}</h6>

                            </div>
                            <div class="buttonG">
                                <a class="btn btn-success w-100" href="{{ route('drive.download', $datafiles->drivesID) }}">
                                    <i class="fa-solid fa-download"></i></a>
                            </div>
                          <p class="card-text textlast"><small class="text-muted">Last updated in
                                        {{ $datafiles->updated_at }} </small></p>
                        </div>
                    </div>
                </div>
            @empty
                <div class="alert alert-warning mx-auto col-6" role="alert">
                    <h1 class=" text-center mt-3">No Data</h1>
                </div>
            @endforelse
        </div>
    @endsection
