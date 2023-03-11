
#first step,c rate web app using .net LTS

#next, open cloudhsell and run the following
dotnet new mvc --name mslearnappservice2321/staging


#go to deployment center blade, chooselocal git... copy the url
#set up credentials
git remote add webapp https://mslearnappservice2321-staging.scm.azurewebsites.net:443/mslearnappservice2321.git

git add 