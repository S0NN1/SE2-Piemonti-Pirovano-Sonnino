package it.polimi.se2.clupapplication.entities;

import javax.persistence.*;

/**
 * This class contains the roles defined by the application, in order to permit the JWT Authentication and authorize requests.
 */
@Entity
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String name;

    @Column
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}