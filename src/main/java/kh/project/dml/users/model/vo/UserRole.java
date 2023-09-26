package kh.project.dml.users.model.vo;

import lombok.Getter;

@Getter
public enum UserRole {
    ADMIN("ROLE_ADMIN"),
    MEMBER("ROLE_MEMBER"),
    SOCIAL("ROLE_SOCIAL");

    UserRole(String value) {
        this.value = value;
    }

    private String value;
}

