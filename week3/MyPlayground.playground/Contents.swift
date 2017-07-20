

var age = 50
var student: String = ""


if age >= 8 && age < 14 {
    student = "초등학교"
} else if age < 17 {
    student = "중학교"
} else if age < 20 {
    student = "고등학교"
} else {
    student = "기타"
}


print(student)


switch age {
case 8..<14:
    student = "초등학생"
case 14..<17:
    student = "중학생"
case 17..<20:
    student = "고등학생"
default:
    student = "기타"
}

print(student)

var languages: [String] = ["스위프트", "C", "JAVA"]
var capitals: [String: String] = [

    "한국": "서울",
    "일본": "도쿄",
    "중국": "베이징",

]

for l in languages {
    print(l)
    
}

for (a, b) in capitals {
    print(a,b)
}

for _ in 0..<10 {
    print("Hi")
}

var i = 0
while i < 100 {
    i += 1
    print(i)
}
