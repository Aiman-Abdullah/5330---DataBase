import csv
# used for managing mysql database connection and performing CRUD operations
# 'mysql_connector' is not the default module of python
# to install this module run the following command
# pip install mysql_connector
import mysql.connector

# The following values are related to mysql database connection
# These values need to be changed as per the requirment
MYSQL_HOST = ''
MYSQL_PORT = 3306
MYSQL_USER = ''
MYSQL_PASSWORD = ''
MYSQL_DATABASE = ''

# The following values are related to path to different csv file
# These csv file contails data for different tables
# These values must never be changed
US_STATE_CSV = "csv/US_state.csv"
US_COUNTY_CSV = "csv/Us_County.csv"
US_CONFIRMED_CASES_CSV = "csv/Us_confirmed_cases.csv"
US_VACCINATION_CSV = "csv/US_Vaccination.csv"
US_DEATHS_CSV = "csv/Us_deaths.csv"


def to_iso_date(datestr):
    month, day, year = datestr.split('/')
    return "{:04d}-{:02d}-{:02d}".format(int(year), int(month), int(day))


def insert_states(conn):
    try:
        with open(US_STATE_CSV, 'r') as f:
            _csv = csv.DictReader(f)
            db = conn.cursor()
            print('inserting into table "state"')
            rows = list()
            for row in _csv:
                municipalPopulation = row['Municipal population'].replace(',', '')
                metropolitanPopulation = row['Metropolitan population'].replace(',', '')
                isPopulousCity = '1' if 'Yes' == row['Most populous city'] else '0'
                municipalPopulation = municipalPopulation if municipalPopulation else None
                metropolitanPopulation = metropolitanPopulation if metropolitanPopulation else None
                rows.append((row['StateID'], row['State'], row['Abreviation'], row['Date of statehood'],
                             row['Capital'], row['Capital since'], row['Land area In Sq Miles'],
                             isPopulousCity,
                             municipalPopulation, metropolitanPopulation))

            try:
                db.executemany(
                    """
                        INSERT IGNORE INTO state
                        (
                            state_id,state,abbreviation_char,YearOfStatehood,
                            capital,capital_since,LandArea,isPopulousCity,
                            MunicipalPopulation,MetroPopulation
                        )
                        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
                    """, rows)
                conn.commit()
            except Exception as e:
                print("error in inserting:", e)
    except Exception as e:
        print('error occured during opening csv file "', US_STATE_CSV, '":', e)


def insert_county(conn):
    try:
        with open(US_COUNTY_CSV, 'r') as f:
            _csv = csv.DictReader(f)
            db = conn.cursor()
            print('inserting into table "county"')
            rows = list()
            for row in _csv:
                if row['Province_State'] and row['County']:
                    rows.append((row['Province_State'], row['County'], row['Population'],
                                 row['Lat'], row['Long']))
            try:
                db.executemany(
                    """
                    INSERT IGNORE INTO county
                    (
                        state,county,population,
                        latitude,longitude
                    )
                    VALUES (%s,%s,%s,%s,%s)
                """, rows)
                conn.commit()
            except Exception as e:
                print("error in inserting:", e)
    except Exception as e:
        print('error occured during opening csv file "', US_COUNTY_CSV, '":', e)


def insert_confirmed_cases(conn):
    try:
        with open(US_CONFIRMED_CASES_CSV, 'r') as f:
            _csv = csv.reader(f)
            db = conn.cursor()
            print('inserting into table "confirmed_cases"')
            state = next(_csv)  # first row is the name of states
            county = next(_csv)  # second row is the name of counties
            rows = list()
            for row in _csv:
                testDate = row[0]
                i = 1
                for col in row[1:]:
                    try:
                        PositiveCount = int(col)
                        if PositiveCount > 0:
                            rows.append((state[i], county[i], to_iso_date(testDate), col))
                    except:
                        pass
                    i += 1
            try:
                db.executemany(
                    """
                        INSERT IGNORE INTO confirmed_cases 
                        (
                            state,county,TestDate,PositiveCount
                        ) 
                        VALUES (%s,%s,%s,%s)
                    """,
                    rows)
                conn.commit()
            except Exception as e:
                print("error in inserting:", e)
    except Exception as e:
        print('error occured during opening csv file "',
              US_CONFIRMED_CASES_CSV, '":', e)


def insert_deaths(db):
    try:
        with open(US_DEATHS_CSV, 'r') as f:
            _csv = csv.reader(f)
            db = conn.cursor()
            print('inserting into table "deaths"')
            state = next(_csv)  # first row is the name of states
            county = next(_csv)  # second row is the name of counties
            rows = list()
            for row in _csv:
                reportDate = row[0]
                i = 1
                for col in row[1:]:
                    try:
                        DeathCount = int(col)
                        if DeathCount > 0:
                            rows.append((state[i], county[i],to_iso_date(reportDate),col))
                    except:
                        pass
                    i += 1
                try:
                    db.executemany(
                        """
                        INSERT IGNORE INTO deaths 
                        (
                            state, county, ReportDate, DeathCount
                        ) 
                        VALUES (%s,%s,%s,%s)
                    """, rows)
                    conn.commit()
                except Exception as e:
                    print("error in insert:", e)
    except Exception as e:
        print('error occured during opening csv file "',
              US_DEATHS_CSV, '":', e)


def insert_vaccinations(conn):
    try:
        with open(US_VACCINATION_CSV, 'r') as f:
            _csv = csv.DictReader(f)
            db = conn.cursor()
            print('inserting into table "vaccinations"')
            rows = list()
            for row in _csv:
                totalDistribution = row['Total Distributed']
                totalAdministered = row['Total Administered']
                distributedPer100k = row['Distributed per 100K']
                adminsteredPer100k = row['Administered per 100K']
                totalDistribution = totalDistribution if 'N/A' != totalDistribution else None
                totalAdministered = totalAdministered if 'N/A' != totalAdministered else None
                distributedPer100k = distributedPer100k if 'N/A' != distributedPer100k else None
                adminsteredPer100k = adminsteredPer100k if 'N/A' != adminsteredPer100k else None
                rows.append((row['State/Territory/Federal Entity'], totalDistribution, totalAdministered, distributedPer100k,
                         adminsteredPer100k, row['People with 1+ Doses'], row['People with 1+ Doses per 100K'],
                         row['People with 2 Doses'], row['People with 2 Doses Per 100K']))
            try:
                db.executemany(
                """
                    INSERT IGNORE INTO vaccinations 
                    (
                        state, TotalDistributed, TotalAdministered, distributed_per_100k,
                        administered_per_100k, people_with_1_plus_doeses,
                        people_with_1_plus_doses_per_100k, people_with_2_plus_doses,
                        people_with_2_plus_doses_per_100k
                    ) 
                    VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
                """,
                    rows)
                conn.commit()
            except Exception as e:
                print("error in insert:",e)
    except Exception as e:
        print('error occured during opening csv file "',
              US_VACCINATION_CSV, '":', e)


if "__main__" == __name__:
    conn = None
    try:
        print('connecting to mysql database')
        conn = mysql.connector.connect(
            host=MYSQL_HOST,
            port=MYSQL_PORT,
            user=MYSQL_USER,
            password=MYSQL_PASSWORD,
            database=MYSQL_DATABASE
        )
        print('connected to mysql database '+MYSQL_DATABASE +
              '@'+MYSQL_HOST+':'+str(MYSQL_PORT))
        insert_states(conn)
        insert_county(conn)
        insert_confirmed_cases(conn)
        insert_deaths(conn)
        insert_vaccinations(conn)
    except Exception as e:
        print("error during connecting to mysql database:", e)
    finally:
        if conn:
            print('closing database connection')
            conn.close()
