from faker import Faker
import pandas as pd
import random
import os

OUTPUT_FOLDER = "data"
os.makedirs(OUTPUT_FOLDER, exist_ok=True)

fake = Faker()
random.seed(42)

NUM_RESEARCHER = 5000
NUM_PAPER = 50000
NUM_INSTITUTION = 500
NUM_CONFERENCE = 200
NUM_TOPIC = 100

# institution
institutions = []
for i in range(1, NUM_INSTITUTION + 1):

    institutions.append({
        "id": f"I{i:04}",
        "name": fake.company() + " University",
        "city": fake.city()
    })

institution_df = pd.DataFrame(institutions)
institution_df.to_csv(
    f"{OUTPUT_FOLDER}/institution.csv",
    index=False
)


# researcher
researchers = []
for i in range(1, NUM_RESEARCHER + 1):

    researchers.append({
        "id": f"R{i:05}",
        "name": fake.name(),
        "email": fake.email(),
        "institution_id":
        f"I{random.randint(1,NUM_INSTITUTION):04}"
    })

researcher_df = pd.DataFrame(researchers)
researcher_df[
    [
        "id",
        "name",
        "email",
        "institution_id"
    ]
].to_csv(
    f"{OUTPUT_FOLDER}/researcher.csv",
    index=False
)


# topic
topics = []
topic_words = [
    "Artificial Intelligence",
    "Machine Learning",
    "Deep Learning",
    "Computer Vision",
    "Natural Language Processing",
    "Data Mining",
    "Cyber Security",
    "Big Data",
    "Cloud Computing",
    "Internet of Things"
]

for i in range(1, NUM_TOPIC+1):
    topics.append({
        "id": f"T{i:04}",
        "topicName":
        random.choice(topic_words)
        + " Research "
        + str(i)
    })

topic_df = pd.DataFrame(topics)
topic_df.to_csv(
    f"{OUTPUT_FOLDER}/topic.csv",
    index=False
)


# conference
conferences=[]
for i in range(1, NUM_CONFERENCE+1):
    conferences.append({
        "id":f"C{i:04}",
        "confName":
        "International Conference on "
        + random.choice(topic_words),
        "year":
        random.randint(2015,2026)
    })

conference_df=pd.DataFrame(conferences)
conference_df.to_csv(
    f"{OUTPUT_FOLDER}/conference.csv",
    index=False
)


# paper
papers=[]
statuses=[
    "submitted",
    "review",
    "published",
    "verified"
]

for i in range(1, NUM_PAPER+1):
    papers.append({
        "id": f"P{i:06}",
        "title": fake.catch_phrase() +" Research Study",
        "year": random.randint(2015,2026),
        "status": random.choice(statuses),
        "conference_id": f"C{random.randint(1,NUM_CONFERENCE):04}"
    })

paper_df=pd.DataFrame(papers)
paper_df.to_csv(
    f"{OUTPUT_FOLDER}/paper.csv",
    index=False
)


# relationship AUTHORED
authored=[]

for paper_id in range(1, NUM_PAPER+1):
    authors=random.sample(
        range(1,NUM_RESEARCHER+1),
        random.randint(1,5)
    )
    for researcher_id in authors:
        authored.append({
            "researcher_id":
            f"R{researcher_id:05}",
            "paper_id":
            f"P{paper_id:06}"
        })

authored_df=pd.DataFrame(authored)
authored_df.to_csv(
    f"{OUTPUT_FOLDER}/authored.csv",
    index=False
)


# relationship COVERS
covers=[]
for i in range(1,NUM_PAPER+1):
    selected_topics=random.sample(
        range(1,NUM_TOPIC+1),
        random.randint(1,4)
    )

    for topic in selected_topics:
        covers.append({
            "paper_id":
            f"P{i:06}",
            "topic_id":
            f"T{topic:04}"
        })

pd.DataFrame(covers).to_csv(
    f"{OUTPUT_FOLDER}/covers.csv",
    index=False
)


# relationship CITES
cites=[]

for i in range(1,NUM_PAPER+1):
    references=random.sample(
        range(1,NUM_PAPER+1),
        random.randint(0,5)
    )

    for ref in references:
        if ref != i:
            cites.append({
                "source_paper":
                f"P{i:06}",
                "target_paper":
                f"P{ref:06}"
            })

pd.DataFrame(cites).to_csv(
    f"{OUTPUT_FOLDER}/cites.csv",
    index=False
)

print("Dataset berhasil dibuat")