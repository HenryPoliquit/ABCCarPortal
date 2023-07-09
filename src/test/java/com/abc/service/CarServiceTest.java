package com.abc.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abc.entity.Car;
import com.abc.entity.CarBidding;
import com.abc.entity.User;
import com.abc.repository.BidRepository;
import com.abc.repository.CarRepository;

@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {

	@InjectMocks
	CarService carService;

	@Mock
	CarRepository carRepository;

	@Mock
	BidRepository bidRepository;

	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}

	/*
	 * @Test public void testSaveCar() { Car car = new Car(); car.setId((long) 1);
	 * car.setName("Audi A3"); car.setModel("A3"); car.setPrice("1500000");
	 * car.setMake("2022"); car.setRegisteration("May 2023");
	 * Mockito.when(carRepository.save(car)).thenReturn(car); Car savedCar =
	 * carService.save(car); Assert.assertEquals(car, savedCar);
	 * 
	 * }
	 */

	@Test
	public void testSearchCar() {
		Car car = new Car();
		String searchInput = "Audi";
		car.setModel(searchInput);
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		Mockito.when(carRepository.search(searchInput)).thenReturn(searchCar);
		List<Car> search = carService.search(searchInput);
		Assert.assertEquals(searchCar, search);
	}

}
