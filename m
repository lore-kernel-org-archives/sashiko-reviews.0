Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD07175A83
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303637; cv=none; b=A0/LZMTyBteINmuhXAEgfdbvG6jr2zhufhDVFJqYXWb45fZ5VYMYRQb3Pg0n5AvK8tYbWAjMTGr7rETRAfjohxli+/93LKnxLkbVQyG/7ySJS5PFLGSnEmMOTrjiV/AilFsR65UfUIatuaxaHwVoyfYW3mQooeBCcdIRT2daDjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303637; c=relaxed/simple;
	bh=VKuA9f4L9c2fHlbPxYh5eVx4PTiH7moY6MV+G6sSpbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIHnKuv+Dz8zZFO/I6Tl9Zd7jJa9Ku9V4uGC0KdJx6nq1uUqkyyYnhc/B991ovlGTshIPrw1VYo7tXqh5Ix+i9NCnxupIQgduWVRpicnCPu6861IN8XyuFCYI0b3Vkkk0pdpNYu1l5NEoH5/GSKWg6HUtc6A4Ch0GQ39c3Hp9PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNN3tq3f; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNN3tq3f"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so654145e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303634; x=1784908434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJZFhVlVRJBtOvN4CxOHlR9fsZLHag9Vm77ey5DeUVg=;
        b=GNN3tq3fU53cdGVe11syl6ulKj5Lv4LUy36tePkFKUllY224SWFLrcwUVIOH/PtIZL
         hZaXjObu0TeZuYH7K9BGXaY5psA3zXb3vKX4awhKxCNPltTso2CKilvFXBUfyEFnJMXx
         VWxl3Z/ptwV+Lobo6CQLZ36e8VgrquZ0xooGNUgajPoklUTlIGr+/e/L1KdE0bgyKmop
         RfmNySCgPivC5LxeF3a383T7J6DPDxX3/tcHfldXDHgs94A9pEf3OvzbTnWTpzjnZebG
         baOCfc4LvQyhnFpQy13cjKQCIZnhk8/ILdDqE/1PadAdXKOJNtnipuQYMvGAzbeRqVqd
         k8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303634; x=1784908434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJZFhVlVRJBtOvN4CxOHlR9fsZLHag9Vm77ey5DeUVg=;
        b=rDjLsJgwGNZKfGM8UWsULRgREf3NWq7/qsyUvLYxRgIhy1JZtGcUGsWbOASLK0tZEF
         Fjfbt4CvoygAx/IU2h19crBl+s5VJijYIf/0YD+5gwo2zsOBYHM3nbJ5Zhn2+SS4+1Y7
         f6OjxXukGa7WftQT3OkureE03OPy5HlVug8H9MPpbawbAhm9wGkYRcv5dEkAG7KgdnDu
         C5LfTgP5GSAJR2f/Cny0P0uxZTzhpqiv9ByQ/X0p9szmAQWMba50vgedoj7s95k3RIN9
         d5N2rxVWHOmW2ZbJyOhy2+ojPed7rOxOKs4KkHeThYRwIbaakSx6UknLxoxpKF7ix1Du
         HyJw==
X-Forwarded-Encrypted: i=1; AHgh+RqbtfMvr8XnOfkLHHd98dvnYOxjQrJUHgvJ1vdypTYYKThPeKDf+hnUeAAbfWFDsSycbuRFjRCF/xk8SsnV5HU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBe+NESM0MC9nR2z9TMsclO1ugm9QJe09f9Wnsa/iL/fFOLDch
	vtpKXoldg9g5fEVMEOH7kGYSlY38OOd/7iteTFt3slaUvsvzW8T4g+IA
X-Gm-Gg: AfdE7cmRlvkubi0W/op/ua2uj3pa8PRBqvUbzMH9CjSVVdYKelY4akvTeEJpejN6nH4
	qP9jzilSgbztsGdO/EdRBLQf5GgpK8ydAuVJaRSznyhYswEimsMlcct08FBOMoG8fJU9dmlp3aW
	NUiK6F8FO2cwaVME3HS2p8/9MZUqc4GXJeMJ/YcwCIhaUwUuIyMftcCPG8HGhZ35Lna81tWuUe7
	Fsk1R09riAS2FSNVOSR1NqsI0mYs7EaXAKxwoV0ABRi5hC1McW2hTJyVjhLN9qAQqz7o8cCI7wQ
	Egvuxpm/OA9H8MRHRzDRCasPZ7ihl9RdwG1mQHG+jzcd7RqaS4jQqDBCYmIscV6nFdJLToa75nk
	rsNE4z261Bvmca2xnukNVDVzk10O2Dp8S55WRneFCu5tI4pDE0mysOdb2bum0ufYo7XVFj05xBA
	YBGDQmG9ibNOcVRZ/ttMZbEwuyrQPhhCbtwynYUYm+a8wNTJhM2QuerdXT7vnD16cF2Q==
X-Received: by 2002:a05:600c:4504:b0:495:495b:9248 with SMTP id 5b1f17b1804b1-4954a3d0cf9mr35460595e9.4.1784303633793;
        Fri, 17 Jul 2026 08:53:53 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcf8dsm5321369f8f.27.2026.07.17.08.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:53:53 -0700 (PDT)
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
Subject: [PATCH v5 2/2] selftest/bpf: added selftest sockmap_basic/sockmap recvfrom eagain
Date: Fri, 17 Jul 2026 16:53:48 +0100
Message-ID: <20260717155348.54975-3-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260717155348.54975-1-nnamdio@gmail.com>
References: <20260717155348.54975-1-nnamdio@gmail.com>
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
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index cb3229711f93..852a12b17e6b 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -1373,6 +1373,117 @@ static void test_sockmap_multi_channels(int sotype)
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
+		err = recvfrom(c, ignored, sizeof(ignored), 0, NULL, NULL);
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
+			ASSERT_NULL(retval, "retval");
+		}
+
+		if (p >= 0)
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
@@ -1451,4 +1562,8 @@ void test_sockmap_basic(void)
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

