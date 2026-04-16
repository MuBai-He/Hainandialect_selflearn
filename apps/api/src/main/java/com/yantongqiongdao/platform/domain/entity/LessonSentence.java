package com.yantongqiongdao.platform.domain.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDateTime;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "lesson_sentences")
public class LessonSentence {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "lesson_id", nullable = false)
    private Long lessonId;

    @Column(name = "mandarin_text", nullable = false, length = 255)
    private String mandarinText;

    @Column(name = "hainan_text", nullable = false, length = 255)
    private String hainanText;

    @Column(name = "meaning_note", length = 255)
    private String meaningNote;

    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder;

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getLessonId() {
        return lessonId;
    }

    public void setLessonId(Long lessonId) {
        this.lessonId = lessonId;
    }

    public String getMandarinText() {
        return mandarinText;
    }

    public void setMandarinText(String mandarinText) {
        this.mandarinText = mandarinText;
    }

    public String getHainanText() {
        return hainanText;
    }

    public void setHainanText(String hainanText) {
        this.hainanText = hainanText;
    }

    public String getMeaningNote() {
        return meaningNote;
    }

    public void setMeaningNote(String meaningNote) {
        this.meaningNote = meaningNote;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }
}
