package db.user.entity;

import lombok.Getter;

@Getter
public enum Role {
    USER(0, "ROLE_USER", "일반 사용자"),
    ADMIN(1, "ROLE_ADMIN", "관리자");

    private final int code;
    private final String value;
    private final String description;

    Role(int code, String value, String description) {
        this.code = code;
        this.value = value;
        this.description = description;
    }

    public int getCode() {
        return code;
    }

    public String getValue() {
        return value;
    }

    public String getDescription() {
        return description;
    }

    // code로 Role 찾기
    public static Role fromCode(int code) {
        for (Role role : Role.values()) {
            if (role.getCode() == code) {
                return role;
            }
        }
        throw new IllegalArgumentException("No role found for code: " + code);
    }
}