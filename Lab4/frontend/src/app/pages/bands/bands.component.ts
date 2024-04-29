import { Component, OnInit } from '@angular/core';
import { BandService } from '../../services/band.service';
import { Band } from '../../models/band';

@Component({
  selector: 'app-bands',
  templateUrl: './bands.component.html'
})
export class BandsComponent implements OnInit {
  bands!: Band[];
  constructor(private bandService: BandService) { }

  ngOnInit() {
    this.bandService.GetBands().subscribe(response=>{
      this.bands = response;
    });
  }
  deleteBand(id: string) {
    if(confirm('Do you confirm deleting the band?')) {
      this.bandService.DeleteBand(id).subscribe(response => {
        if (response.status === 200) {
          for (let i = 0; i < this.bands.length; i++) {
            if(id === this.bands[i]._id) {
              this.bands.splice(i, 1);
              break;
            }
          }
        }
      });
    }
  }
}
