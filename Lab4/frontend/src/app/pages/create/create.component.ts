import { Component, OnInit } from '@angular/core';
import { BandService } from '../../services/band.service';
import { Band } from '../../models/band';
import { NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-create',
  templateUrl: './create.component.html'
})
export class CreateComponent implements OnInit {
  band: Band;
  currentYear: number = new Date().getFullYear();
  constructor(private bandService: BandService, private router: Router, private route: ActivatedRoute) {
    this.band = new Band();
  }

  ngOnInit() {
    this.route.params.subscribe(params => {
      let id = params['id'];
      if(id !== undefined) {
        this.bandService.GetBand(id).subscribe(response => {
          this.band = response;
        });
      }
    });
  }
  SaveData(form: NgForm) {
    if (form.valid) {
      if (this.band._id !== undefined) {
        this.bandService.UpdateBand(this.band).subscribe(response => {
          if (response.status === 200) {
            this.router.navigate(['/']);
          }
        });
      } else {
        this.bandService.AddBand(this.band).subscribe(response => {
          if (response.status === 201) {
            this.router.navigate(['/']);
          }
        });
      }
    }
  }
}
