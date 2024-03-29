﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using TrainingFPT.DBContext;

#nullable disable

namespace TrainingFPT.Migrations
{
    [DbContext(typeof(TraningDBContext))]
    [Migration("20240220080605_Courses")]
    partial class Courses
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.2")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("TrainingFPT.DBContext.CategoriesDBContext", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime?>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("Varchar(200)")
                        .HasColumnName("Description");

                    b.Property<string>("NameCategory")
                        .IsRequired()
                        .HasColumnType("Varchar(50)")
                        .HasColumnName("NameCategory");

                    b.Property<int>("ParentId")
                        .HasColumnType("integer")
                        .HasColumnName("ParentId");

                    b.Property<string>("PosterImage")
                        .IsRequired()
                        .HasColumnType("Varchar(200)")
                        .HasColumnName("PosterImage");

                    b.Property<string>("Status")
                        .IsRequired()
                        .HasColumnType("Varchar(20)")
                        .HasColumnName("Status");

                    b.Property<DateTime?>("UpdatedAt")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("Categories");
                });

            modelBuilder.Entity("TrainingFPT.DBContext.CourseDBContext", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("CategoriesId")
                        .HasColumnType("int");

                    b.Property<int>("CategoryId")
                        .HasColumnType("int");

                    b.Property<DateTime?>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("Varchar(200)")
                        .HasColumnName("Description");

                    b.Property<string>("Image")
                        .IsRequired()
                        .HasColumnType("Varchar(200)")
                        .HasColumnName("Image");

                    b.Property<int?>("LikeCourse")
                        .HasColumnType("integer")
                        .HasColumnName("LikeCourse");

                    b.Property<string>("NameCourse")
                        .IsRequired()
                        .HasColumnType("Varchar(60)")
                        .HasColumnName("NameCourse");

                    b.Property<int?>("StarCourse")
                        .HasColumnType("integer")
                        .HasColumnName("StarCourse");

                    b.Property<string>("Status")
                        .IsRequired()
                        .HasColumnType("Varchar(20)")
                        .HasColumnName("Status");

                    b.Property<DateTime?>("UpdatedAt")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.HasIndex("CategoriesId");

                    b.ToTable("Courses");
                });

            modelBuilder.Entity("TrainingFPT.DBContext.RolesDBContext", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime?>("CreatedAt")
                        .HasColumnType("datetime2");

                    b.Property<DateTime?>("DeletedAt")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .HasColumnType("Varchar(200)")
                        .HasColumnName("Description");

                    b.Property<string>("NameRole")
                        .IsRequired()
                        .HasColumnType("Varchar(50)")
                        .HasColumnName("NameRole");

                    b.Property<string>("Status")
                        .IsRequired()
                        .HasColumnType("Varchar(20)")
                        .HasColumnName("Status");

                    b.Property<DateTime?>("UpdatedAt")
                        .HasColumnType("datetime2");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("TrainingFPT.DBContext.CourseDBContext", b =>
                {
                    b.HasOne("TrainingFPT.DBContext.CategoriesDBContext", "Categories")
                        .WithMany()
                        .HasForeignKey("CategoriesId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Categories");
                });
#pragma warning restore 612, 618
        }
    }
}
