package com.example.demo.model;

import lombok.Data;

import javax.persistence.*;

//Data from lombok so we dont have to put getter and setter
@Data
@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String name;
}
