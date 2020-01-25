/*
Write queries to answer the following questions
Save your work to this .sql file
Right click on the file name in the Project pane and select Refactor > Rename, and replace STU_NUM with your student number.
*/

--1. Which employees have 'IT' in their job title? (list their EmployeeId, FirstName, LastName and Title)
SELECT EmployeeId, FirstName, LastName, Title FROM Employee
WHERE Title LIKE "%IT%";

--2. List the names of all Artists and the titles of their albums
SELECT Artist.Name, Album.Title
FROM Artist
    JOIN Album ON Album.ArtistId = Artist.ArtistId;

--3. Which track is features on the greatest number of times in playlists and how many times is it included? (display Trac
SELECT Track.Name, count(*)
From Track
    JOIN PlaylistTrack ON Track.TrackId = PlaylistTrack.TrackId
    JOIN Playlist ON PlaylistTrack.PlaylistId = Playlist.PlaylistId
GROUP BY Track.TrackId
ORDER BY count(*) DESC;

--4. Provide a list of the number of tracks by each artist
SELECT Artist.Name, count(Track.TrackId)
FROM Track
    JOIN Album ON Album.AlbumId = Track.AlbumId
    JOIN Artist ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name;

--5. How much money has been invoiced for the artist Deep Purple? (display each line item from the invoices and the total amount)
SELECT Artist.Name, SUM(Invoice.Total)
FROM Invoice
    JOIN InvoiceLine ON InvoiceLine.InvoiceId = Invoice.InvoiceId
    JOIN Track ON Track.TrackId = InvoiceLine.TrackId
    JOIN Album ON Album.AlbumId = Track.AlbumId
    JOIN Artist ON Artist.ArtistId = Album.ArtistId
    WHERE Artist.Name = 'Deep Purple';