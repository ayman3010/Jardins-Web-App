import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoPlanteComponent } from './info-plante.component';

describe('InfoPlanteComponent', () => {
  let component: InfoPlanteComponent;
  let fixture: ComponentFixture<InfoPlanteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InfoPlanteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InfoPlanteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
