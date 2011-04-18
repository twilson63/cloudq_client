Cloudq::Connection.url =
"https://usertoken:password@cloudq.eirenerx.com"

Cloudq::Publish.job :send_fax, 

    { "job": {
         "klass": "SendFax",
         "args": { "images": ["s3-image1","s3-image2"], 
            "to": "555-123-1234", "cover-sheet": "awesomefax", "report": "fax_report.rpt"
          }
        }
    }
