docker ps | grep tzz_work
if [ $? -ne 0 ];then
	docker run -dt --name tzz_work tangzz/tzz_work_env
fi
docker exec -it tzz_work bash

