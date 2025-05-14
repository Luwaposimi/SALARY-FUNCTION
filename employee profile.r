library(readr)  # Required for read_csv


zip_file <- "Employee Profile.zip"
extract_dir <- "extracted_files"
csv_path <- file.path("Employee Profile", "employee_details.csv")


if (file.exists(zip_file)) {

  if (!dir.exists(extract_dir)) {
    dir.create(extract_dir)
  }


  unzip(zip_file, exdir = extract_dir)


  full_csv_path <- file.path(extract_dir, csv_path)


  if (file.exists(full_csv_path)) {
    employee_data <- read_csv(full_csv_path)
    print("First few rows of the employee data:")
    print(head(employee_data))
  } else {
    stop("Error: 'employee_details.csv' not found inside the unzip folder
     'Employee Profile'.")
  }
} else {
  stop("Error: 'Employee Profile.zip' not found in the current directory.")
}
