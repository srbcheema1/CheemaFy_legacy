#include <iostream>
#include <vector>
#include <boost/iostreams/filtering_stream.hpp>
#include <boost/iostreams/filter/bzip2.hpp>
#include <boost/iostreams/filter/gzip.hpp>
#include <boost/iostreams/filter/zlib.hpp>
// g++ -std=c++11 compressed_vcf_reader.cpp -lboost_iostreams

std::string BZ2 = ".bzip2";
std::string ZIP = ".zip";
std::string TAR_GZ = ".gz";
std::string Z = ".Z";
std::string ZLIB = ".z";
std::string NO_EXT = "";

std::vector<char>&readline(std::istream & stream, std::vector<char> & container) ;

void get_magic_num(std::istream & stream, std::vector<char> & container);

std::string get_compression(std::string const & source,
                            const std::vector<char> &line);

void create_uncompressed_stream(std::istream & input,
                                const std::string & sourceName,
                                boost::iostreams::filtering_istream & uncompressed_input);


void print_line(std::vector<char> &line)
{
    std::string str(line.begin(), line.end());
    std::cout << "--" << str ;
}

int main () {
    boost::iostreams::filtering_istream in;
    boost::iostreams::filtering_istream cinn(std::cin);
    create_uncompressed_stream(cinn,"",in);

    std::vector<char> line;
    while (readline(in, line).size() != 0) {
        print_line(line);
    }
}

void create_uncompressed_stream(std::istream & input,
                                const std::string & sourceName,
                                boost::iostreams::filtering_istream & uncompressed_input)
{
    std::vector<char> line;
    get_magic_num(input, line);

    std::string file_ext = get_compression(sourceName, line);

    if(file_ext == BZ2) {
        uncompressed_input.push(boost::iostreams::bzip2_decompressor());
    } else if(file_ext == TAR_GZ) {
        uncompressed_input.push(boost::iostreams::gzip_decompressor());
    } else if(file_ext == ZLIB) {
        uncompressed_input.push(boost::iostreams::zlib_decompressor());
    } // not working.

    uncompressed_input.push(input);
}

void get_magic_num(std::istream & stream, std::vector<char> & container)
{
    char c;
    int i = 0;
    container.clear();

    while (stream && stream.get(c)) {
        container.push_back(c);
        i++;
        if (c == '\n' || i > 4) break;
    }

    for (int j = container.size()-1; j >= 0; --j) {
        stream.putback(container[j]);
        if (stream.fail() || !stream) {
            std::cout << "Failed to unget the characters "
                      << "get_magic_num not working as expected. \n";
        }
    }
}

std::string get_compression(std::string const & source,
                            const std::vector<char> &line)
{

    std::vector<std::pair<std::vector<char>, std::string>> types = {
        { { 66, 90, 104 }, BZ2 },
        { { 31, -117 }, TAR_GZ },
        { { 31, -99 }, Z },
        { { 120, -100 }, ZLIB },
        { { 80, 75, 3, 4 }, ZIP }
    };

    for (auto & type : types) {
        if (std::equal(type.first.begin(), type.first.end(), line.begin())) {
            std::cout << "detected " << type.second
                << " compression" << std::endl;
            return type.second;
        }
    }
    return NO_EXT;
}

std::vector<char>&readline(std::istream & stream, std::vector<char> & container)
{
    char c;
    container.clear();
    while (stream && stream.get(c)) {
        container.push_back(c);
        if (c == '\n') break;
    }
    return container;
}
