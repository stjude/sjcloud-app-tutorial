# St. Jude App Tutorial

This repository contains the example app tutorials that demonstrate how to manipulate and work with the data requested from the [St. Jude Cloud Platform](https://www.stjude.cloud/). The examples hosted in this repository are meant to serve as a starting point for developing your own application.

## Documentation

For more information on how to request and access datasets and how to write apps and tools to manipulate data in the cloud, refer to the [St. Jude Cloud Documentation](https://www.stjude.cloud/docs/).

This repository hosts the example tutorial applications located in the [Data Guides > Creating a Cloud Application](https://www.stjude.cloud/docs/guides/data/creating-a-cloud-app/) section.

## Requirements

For accessing St. Jude next generation sequencing data and writing cloud applications, you will need a [DNAnexus account](https://www.stjude.cloud/docs/create-an-account/) and [dx-toolkit](https://wiki.dnanexus.com/downloads). To explore or manage datasets, refer to our guide [Working with Our Data](https://www.stjude.cloud/docs/guides/data/working-with-our-data/).

## Apps

* `dx-adapter-trim` - Example application that uses cutadapt to trim sequencing adapters. This app demonstrates providing data to the app via the resources directory. Note this should primarily be used for small, app-specific resources.
* `dx-bam-to-fastq` - Example application that extracts FastQ files from aligned BAMs. This app demonstrates returning an array of files as output.
* `dx-bwa-mem` - Example application that aligns FastQ files to a reference genome using BWA-MEM. Demonstrates pulling reference files from the common St. Jude Cloud Reference Data project dynamically based on user input for use in the application.
* `dx-cwl-alignment` - Example application that aligns FastQ files to a reference genome, sorts the resulting BAM, indexes the BAM, and then produces a flagstat. The pipeline is orchestrated using CWL. The CWL workflow is run in parallel on a single node using multiple cores.
* `dx-fastqc-example-app` - Example application used in the [Data Guides > Creating a Cloud Application](https://www.stjude.cloud/docs/guides/data/creating-a-cloud-app/) section of the St. Jude Cloud documentation.

## Feedback

This repository is still currently under construction. If you have any additional questions, be sure to [contact us](https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-contact/)!

## References

For more information, visit:
* [St. Jude Cloud](https://www.stjude.cloud/)
* [St. Jude Cloud Documentation](https://www.stjude.cloud/docs/)
* [DNAnexus Wiki](https://documentation.dnanexus.com/)

## License

* [Apache License 2.0](./LICENSE)
