Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3E0439908
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567748; cv=none; b=pVooVDLwHQnVs9BECpwJf7iZdcj/wZAnvcls3AjRgoO1+K9ZwUmXJeg0aNGnYPxbqyCrULLXJvALQyl4P/UvE2aE8dGMd/dvOr6qeymFRy/69dywdni3iUIs9pBigL3+3AZouLHm3z+hb5TTSxEgHZzLFwXr/PxXdGHNNyd5fns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567748; c=relaxed/simple;
	bh=64a4DlTYawvxG91ejYkDajPG8YP3qyD1+Oc+1khMMCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJzC9hHJQb8bGVrfWnGuhROr3lqkt9Iykt1s9u2jrUnnSVwHte8RNKmVoKxAYxu9xVciqidro85KYL9SBuNo8zS9CZA1qV32rlyzSbyYXGmJyJx3y6CJu6l1UvdxyV6J8l7KDX1VQjMpZOkWFWto8OkHx2HGdTQp3qkW6mBHi70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZN/ZvXk; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZN/ZvXk"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so5671997f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784567741; x=1785172541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1cSOK1WPe3ELJQklD1aQ2qR0lnoMm7ijOjPxD/9WX8=;
        b=SZN/ZvXkRPSBEbHlN3OXRUfAqttRx1x9uoOZweHdTRYx5B16z6iYcphhEXtBhM5kB5
         SxAvv2ltGWQ8uFOTaQ52xPPilmau1K+24AQJFVeAmdUswUANJuqXDLSMPTd0VUhqD4r6
         66HbXiyPwDheWly6TrkHx8mcWFLirudg8PSkjYmHtcOt8PfQ3HsMt9acIEIGp1r63LUT
         1eIgEJhndE8/xxUDDgBJktpam+FzZP4VutmZcoQtiqp/a6kYwshbRxwr0dhh81Ifuw/i
         pNuU2yATZNL/+k3Qc76/bgBgf5D7ND2YrAiKH07AUFTX3HcmyKmHYJlJaRfaDz6ybY80
         JUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567741; x=1785172541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1cSOK1WPe3ELJQklD1aQ2qR0lnoMm7ijOjPxD/9WX8=;
        b=PGnVCKlI10E0qFcVGd3MsXMnK+jBsbA95y5y7Ci9DH/oEnPq2mn2d0lrRIAUfP8NYS
         Ke7RHGY9oDbzhrbCGjaPZ2dBZOp3f8Xyf9e0RLJ6KlfwRxD3SgtJgVIgEEqYjmxi6fGr
         m5OivqM+sqVloB40lkwc7wm1ufbfPOnNg7ApV2W9yYmFFAitE6jgXaueHpntQ6m/dQxZ
         YVqmiw3DGUQjVhb+6IovonZ2HsuOcDtaIjaD4zcLi4QjTzxSnCdEj/sHXZkBRbyWMQJF
         xbC74hjme6bP5tHTxjmHxfAKn4uYtnRn7IvKynCsM+ZjtOzcAXThxleYna4voWeCfwrh
         tmjQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrk8VDszsZL1IfwjpJmLUjexVgj8CcAhK0xpn1WEfDeVIKYVz8pyOsYpdvd3xwML63MWUMXdc6db+goS3XdiiU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWLTYu/e9fWmvUw3LSAEi2cVuTnAYIes/9QSLZUUUFgB05N3DG
	y/bqEl2gaw39tV0PrVoX8XOhp3hEhz3U+wdMf9EQB+hLFi5dvEwiNSFq
X-Gm-Gg: AfdE7ck1iWXjw0qQxp8jRbXug8LjQSDehuIkHWex2/VdNPXx19zKnQEpqrQHrmH8c08
	pYmko2Cglt/VWMm7JFHD+f1OMXlyb2MoMTQmRkFp2eFbLv+0sRBXTuEcLjhRCEkVy1hJTsK88ZD
	mOqI1qb5C6ooyep1N3HHX8XxNvzZNoq69JtVpzia84Y7HsbHIw/hg0iUQUvcNy9zvMI6XiYZAK4
	F+TN+zRXetdNZX7S/M4oPRs7yMPXV4iE+vuJhf1kKKCNvSt+NPQPHujfnl7LnY2X6Ns0wfplPiY
	nuMo4HxjZZXufN3uelW4//IE5hx+dmxc6jMtx/46IqIdGjrM1mOBEduweMscHwrX7yN5KGNAM/f
	gVJmvtoS2NcJ7T6cM6gPA4rgl8y6J+JI1qRDTvdd5Uqpi9LztJrokiNUGll1GMGwz9A1cYAD3la
	v+HK3HAfjY7VBxeo+IIjmAgRFlGm0cQ4qvqIzGUW9ddoP9zY+KU4/XJbTktJZIK0kZAg==
X-Received: by 2002:a05:600c:524a:b0:495:641a:bd3f with SMTP id 5b1f17b1804b1-495641abe94mr24542225e9.13.1784567741407;
        Mon, 20 Jul 2026 10:15:41 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547af7esm2304865e9.8.2026.07.20.10.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:15:40 -0700 (PDT)
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: nnamdio@gmail.com
Cc: bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	jakub@cloudflare.com,
	jiayuan.chen@linux.dev,
	john.fastabend@gmail.com,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] selftests/bpf: add sockmap recvfrom EAGAIN selftest
Date: Mon, 20 Jul 2026 18:15:35 +0100
Message-ID: <20260720171535.67867-3-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260720171535.67867-1-nnamdio@gmail.com>
References: <20260720171535.67867-1-nnamdio@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These selftests exercise the tcp_bpf_recvmsg() and tcp_bpf_recvmsg_parser()
functions, to ensure that they are properly handling spurious wakeups in
tcp_msg_wait_data().

The expected behaviour is that recvfrom() does not return an EAGAIN
error.  If the spurious wakeups are incorrectly handled, this assertion
will fail.

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index cb3229711f93..d18faf46fac0 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -1373,6 +1373,126 @@ static void test_sockmap_multi_channels(int sotype)
 	test_sockmap_pass_prog__destroy(skel);
 }
 
+static void *test_sockmap_recvfrom_eagain_thread(void *arg)
+{
+	int fd = *(int *)arg;
+	char buf[1024];
+	void *result = NULL;
+
+	while (true) {
+		ssize_t len = recvfrom(fd, buf, sizeof(buf), 0, NULL, NULL);
+
+		if (len == -1) {
+			if (errno == EINTR)
+				continue;
+			result = (void *)1;
+			break;
+		}
+
+		if (!len || buf[len - 1] == 'e')
+			break;
+	}
+
+	send(fd, "test", 4, MSG_NOSIGNAL);
+
+	close(fd);
+
+	return result;
+}
+
+static void test_sockmap_recvfrom_eagain(bool with_verdict)
+{
+	struct test_sockmap_pass_prog *skel = NULL;
+	struct bpf_program *prog = NULL;
+	size_t buflen = 1024 * 1024 * 25;
+	char *buf = NULL;
+	int map, err;
+
+	skel = test_sockmap_pass_prog__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	map = bpf_map__fd(skel->maps.sock_map_msg);
+
+	if (with_verdict) {
+		prog = skel->progs.prog_skb_verdict;
+		err = bpf_prog_attach(bpf_program__fd(prog), map, BPF_SK_SKB_STREAM_VERDICT, 0);
+		if (!ASSERT_OK(err, "bpf_prog_attach verdict"))
+			goto cleanup;
+	}
+
+	buf = malloc(buflen);
+	if (!ASSERT_OK_PTR(buf, "malloc buf"))
+		goto cleanup;
+	memset(buf, 0, buflen);
+	buf[buflen - 1] = 'e';
+
+	for (int i = 0; i < 200; ++i) {
+		ssize_t sent;
+		char ignored[128];
+		pthread_t thread;
+		bool thread_created = false;
+		size_t rem = buflen;
+		int c = -1, p = -1, zero = 0;
+		bool success = false;
+
+		err = create_pair(AF_INET, SOCK_STREAM, &c, &p);
+		if (!ASSERT_OK(err, "create_pair"))
+			goto end_attempt;
+
+		err = pthread_create(&thread, NULL, &test_sockmap_recvfrom_eagain_thread, &p);
+		if (!ASSERT_OK(err, "pthread_create"))
+			goto end_attempt;
+		thread_created = true;
+
+		err = bpf_map_update_elem(map, &zero, &c, BPF_ANY);
+		if (!ASSERT_OK(err, "bpf_map_update_elem"))
+			goto end_attempt;
+
+		while (rem) {
+			sent = xsend(c, buf + (buflen - rem), rem, 0);
+			if (sent == -1)
+				goto end_attempt;
+			rem -= sent;
+		}
+
+		/* we cannot use recv_timeout(), otherwise EAGAIN would be an expected errno. */
+		err = recvfrom(c, ignored, sizeof(ignored), 0, NULL, NULL);
+
+		/*
+		 * we are checking for the invalid return of EAGAIN, any other return is considered
+		 * successful for the purposes of this test.
+		 */
+		if (err < 0 && !ASSERT_NEQ(errno, EAGAIN, "recvfrom eagain"))
+			goto end_attempt;
+
+		success = true;
+
+end_attempt:
+		if (c >= 0)
+			close(c);
+
+		if (thread_created) {
+			void *retval = NULL;
+
+			pthread_join(thread, &retval);
+			if (!ASSERT_NULL(retval, "retval"))
+				success = false;
+		}
+
+		if (!thread_created && p >= 0)
+			close(p);
+		if (!success)
+			break;
+	}
+
+cleanup:
+	if (buf)
+		free(buf);
+
+	test_sockmap_pass_prog__destroy(skel);
+}
+
 void test_sockmap_basic(void)
 {
 	if (test__start_subtest("sockmap create_update_free"))
@@ -1451,4 +1571,8 @@ void test_sockmap_basic(void)
 		test_sockmap_multi_channels(SOCK_STREAM);
 	if (test__start_subtest("sockmap udp multi channels"))
 		test_sockmap_multi_channels(SOCK_DGRAM);
+	if (test__start_subtest("sockmap recvfrom eagain"))
+		test_sockmap_recvfrom_eagain(false);
+	if (test__start_subtest("sockmap recvfrom eagain with verdict"))
+		test_sockmap_recvfrom_eagain(true);
 }
-- 
2.52.0

