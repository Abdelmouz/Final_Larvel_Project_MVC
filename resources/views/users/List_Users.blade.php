@extends('layouts.app')
@section('content')
    <div class="container col-8">
        <h1 class="text-center text-info  p-2 rade-5">All Users</h1>
        <div class="card">
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nmae</th>
                            <th>Email</th>
                            <th>Rule</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php $i = 1; ?>
                        @forelse ($dataUsers as $data)
                            <tr>
                                <th scope="row">{{ $i }}</th>
                                <td>{{ $data->name }}</td>
                                <td>{{ $data->email }}</td>
                                <td>{{ $data->rule }}</td>
                            </tr>
                            <?php $i++; ?>
                        @empty
                        @endforelse

                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
