import http from "k6/http";
import { check, sleep } from "k6";

export let options = {
 vus: 10,
 duration: "20s"
};

export default function() {
   let res = http.get("http://localhost:8888/example_response");
   check(res, {
       "status was 200": (r) => r.status == 200,
   });
};
