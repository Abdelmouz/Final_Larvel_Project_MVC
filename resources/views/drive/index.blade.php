@extends('layouts.app')
@section('content')
    <div class="container">
        @if (Session::has('done'))
            <div class="alert alert-info mx-auto col-6" role="alert">
                {{ Session::get('done') }}
            </div>
        @endif
        <div class="container col-8">
            <h1 class="text-center text-info  p-2 rade-5">Your Drive</h1>
            @forelse ($data_file as $datafiles)
                <div class="card mx-auto mt-3 cardFile">
                    <div class="row no-gutters">
                        <div class="col-md-4">
                            <img src="{{ asset('image/file.png') }}" alt="">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body mb-4 ">
                                <h5 class="card-title mb-3">{{ $datafiles->title }}</h5>
                                <p class="card-text">{{ $datafiles->description }}.</p>
                                <p class="card-text"><small class="text-muted">Last updated in
                                        {{ $datafiles->updated_at }} </small></p>
                            </div>
                            <div class="buttonG">
                                <a class="btn btn-success w111" href="{{ route('drive.download', $datafiles->id) }}">
                                    <i class="fa-solid fa-download"></i></a>
                                <a class="btn btn-primary w111" href="{{ route('drive.edit', $datafiles->id) }}">
                                    <i class="fa-solid fa-pen-to-square"></i></a>
                                <a class="btn btn-warning w111" href="{{ route('drive.state', $datafiles->id) }}">
                                    @if ($datafiles->state == 'public')
                                        <i class="fa-solid fa-lock" style="color: #f2f2f2;"></i>
                                    @else
                                        <i class="fa-solid fa-lock-open" style="color: #f2f2f2;"></i>
                                    @endif
                                </a>
                                <a class="btn btn-danger w111" href="{{ route('drive.destroy', $datafiles->id) }}">
                                    <i class="fa-solid fa-trash"></i></a>

                            </div>
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
