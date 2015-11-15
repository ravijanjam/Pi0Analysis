
void loadLibrairies(const char * libraryPath) {
   
    string name;
    char * list[]={"CMSmsPi0Correlations_cxx"};
    cout <<"-I- loadLibrairies() Started: "<<name<<endl;
   
    name = libraryPath;
    name += list[];

    gSystem->Load(name.c_str());
    cout <<"loadLibrairies() -I- Done"<<endl;

}

void CMSpi0Analyzer(const char *inputFileList = "./FileList_pPbData.txt",
                    const unsigned int nFilesToProcess = 2,
                    const char *libraryPath = "/gpfs22/home/sharmam/pPbSharma/Test/")
{
    
    loadLibrairies(libraryPath); 
    cout<< "-I- class loaded, opening the input file now (...) " <<endl;
    
    unsigned int kFile = 0;
    ifstream inFile(inputFileList);
    if(inFile.eof()) {
        cerr << "\n Unable to find inputFileList input file";
        cerr << endl;
        return;
    }
    
    char fileName[400];
    
    while(!inFile.eof()) {
        
        if(kFile >= nFilesToProcess)
            break;
        
        inFile.getline(fileName, 400);
        if(inFile.eof()) {
            cout << "\n Breaking from the input file list reading at kFile = " << kFile << endl;
            break;
        }
    
    
    cout<<" File I am about to open: "<<fileName<<endl;
    cout << "-I- Instantiate the class " << endl;
    CMSmsPi0Correlations *pi0 = new CMSmsPi0Correlations();
	pi0->ReadTTree(fileName);
    }
	
}
