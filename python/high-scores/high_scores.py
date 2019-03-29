class HighScores(object):
    def __init__(self, scores):
        self.scores = scores

    def latest(self):
        return self.scores[-1]

    def personal_best(self):
        return max(self.scores)

    def personal_top_three(self):
        # sort_list = self.scores.copy()
        # sort_list.sort(reverse=True)
        # l = 3 if len(sort_list) > 3 else len(sort_list)
        # return sort_list[0:l]
        return sorted(self.scores, reverse=True)[:3]
