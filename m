Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B143F4AF
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673506; cv=none; b=QIK4LaBSX2GAmPz29JetHlpjHaLy7DU9It2WKUu1dunioHmbJds1AuFXewJaiY4AJAVyeDAiCOGmT9i87WCe4z0y/j6Mq0fWsbakAyd1tkDVH3XcLprClGtw7SIo/Ei+IldGs5a1PFjHxS0XktaRffuuGcO3pOGHVbZtrkah/AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673506; c=relaxed/simple;
	bh=vYRv8k58w2CyhMVmSqDuCi/hXQhCUhaEV1xMDAbbB8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=He/ZRXoMHFxrhI/vjJ8y8370k0aFrqfY6D/vNbzJfb/UGg0hiGt1gHDFL8UMHf82F4DneGjx1Rsen1EszKvqG3Ny++/LgjzIBgKIDDIgf1PX9Q4ozIF6BUf70S/zXmDQk+o2J+W1V33Th2Ek/rBppEcH5DnqWakhI3e201XNnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOjOW5An; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOjOW5An"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so29886105e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 15:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784673493; x=1785278293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0WJnnhXlTqHAzSRlQQl5c6vDIzceJyXSF5sIOHpwqM=;
        b=NOjOW5Anx6RkVjavP06AQe7EV7x17MEQWoMNbapKElRYxBf8SETcQ2HLqidcuK5kHP
         UMEWJiBFyLvdneLm20reQRHqvZUWajCONuIDpMlJIu/Fssg7AKQWVOcSO5XVHwt5dqu+
         gI2Oq3Jw4iOhU9ZgQynQ23r/K/3WzWzfLAPa91xxo5PZhXJ6Cq+Pq7AOHrTOj7lBwVEd
         PAl2k3ZnGmjNra+k6CPfPAwkkhK5pCsodIlEmBi0eMv5wVogn+gNszzU9xffX1pkFXg6
         4d6Kt3ZvIernLCvxR8OsdDor6mTPEWu99dj49r53axosWQOF69FaNgxUeQ+T9pWVzR+j
         PAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673493; x=1785278293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0WJnnhXlTqHAzSRlQQl5c6vDIzceJyXSF5sIOHpwqM=;
        b=TGuce0u3/QQoUZKc+NWCdjJ9su/3uBNjE/gJSGhGnWSD+K7fJCE4BjoHez7UK7Gx5j
         d2BsA32xphBN2HaTN5S+U6t2isaOBH82v2/YMgqGMdgcIeblCl0uJtSk2ZlF2NGSYBqu
         ZwkMr7hyj0ZieuH78xRegfFpEeiQXvkEkzqMssuwib7QI6w9ArnOw40rnpvPZS3reyRr
         jNt9L0uqMeudM9Yz1+VvrPDZL85GEbj43qnmBwXyWtGVF0JOp9hMubA6H1+DxUtTKWXn
         RLAY77iu3fFw8ZHkZQ1gMXhI69tdfwrl9r9Hr4lWoLJ5mOZh20FY9ReCIcNq70grbN+t
         NW2A==
X-Forwarded-Encrypted: i=1; AHgh+RoR5csbsp6/ygkHYKiRNnt5ZmGWY8gZkOJ3BMWdtsbuWk3LENKru0hSxCv2K/tXhWEmZCuqPY6mnxD0qay80Sk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5iGh5RinSlGpRHlcP5pbbfywVxczqMCHWS/DP425VfEtnGgC/
	KJiiOXQDTQA4s25yeBA+OSOJT0lsDk6byo3Cn74LLhwrTMWKfzAUjOdZ
X-Gm-Gg: AfdE7ckuFVKZPDM7/TW8JvbV+XJc/IGubv8OUnCGsd/0amxo6N+UZdpgD8RE5DdGnqn
	3lMb+HbmU8ymf5/M0V2YsftlY4ot1udsuG48+YsEPEk1BDl5S05smwSR33uiR0PS+EnGzSaZ0hc
	UD1N8WNt4jZkY4EqFuvvlCKZj6BGhDtJMCnFG2NHAJQ/mZmyYV4jiOhXXe2U7PZ/Ocj+ZX18Vph
	1y3xKZGq1KXVUyU6tjnNKpx+lIwTAdgyGCD7xXGjgMoEFYFys5X9VV8cLpvLelRJAFThqYZlvvI
	YiAe5XKSgntixMVDv7GXJfDXrYxh175KZYrJQ+sIzCv2FEOAlQn63ahD41+FobvApjFIFTksSq1
	81duNGHrtIkaZFy6cD3rvW3q0KTN4VtO0HtvQ4ZKXfxviJkciaPIAg+4femBpEkqQ/8FQ6wk8OZ
	A7ssQQLD//qBxt67Mqai2mcF0FeKd/9xfT9cpPGmLLwabHyikau5yLyygVZBkvQgImLVJfl2/sI
	CDm
X-Received: by 2002:a05:600c:1396:b0:493:b150:c607 with SMTP id 5b1f17b1804b1-4954a3f36a9mr223998835e9.12.1784673493285;
        Tue, 21 Jul 2026 15:38:13 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm101290455e9.12.2026.07.21.15.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:38:12 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	emil@etsalapatis.com
Subject: [PATCH v7 2/2] selftests/bpf: add sockmap recvfrom EAGAIN selftest
Date: Tue, 21 Jul 2026 23:38:07 +0100
Message-ID: <20260721223807.75101-3-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260721223807.75101-1-nnamdio@gmail.com>
References: <20260721223807.75101-1-nnamdio@gmail.com>
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
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
index cb3229711f93..afda4d90e573 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
@@ -1373,6 +1373,138 @@ static void test_sockmap_multi_channels(int sotype)
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
+	char *buf = NULL;
+	int map, err;
+
+	/*
+	 * the size of the buffer to send.  completion of the sending can trigger a spurious wake
+	 * up.  larger values make the issue more likely, but make successful test runs longer.
+	 */
+	const size_t buflen = 1024 * 1024 * 25;
+
+	/*
+	 * maximum number of attempts to reproduce EAGAIN on spurious wake up.  more attempts
+	 * increases the chances of triggering the issue, and the test ends as soon as we do.
+	 * however, successful runs would take longer to complete.
+	 */
+	const int max_attempts = 300;
+
+	skel = test_sockmap_pass_prog__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+
+	map = bpf_map__fd(skel->maps.sock_map_rx);
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
+	for (int i = 0; i < max_attempts; ++i) {
+		ssize_t len;
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
+			len = xsend(c, buf + (buflen - rem), rem, 0);
+			if (len == -1)
+				goto end_attempt;
+			rem -= len;
+		}
+
+		/* we cannot use recv_timeout(), otherwise EAGAIN would be an expected errno. */
+		len = recvfrom(c, ignored, sizeof(ignored), 0, NULL, NULL);
+
+		/*
+		 * we are checking for the invalid return of EAGAIN, any other return is considered
+		 * successful for the purposes of this test.
+		 */
+		if (len < 0 && !ASSERT_NEQ(errno, EAGAIN, "recvfrom eagain"))
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
@@ -1451,4 +1583,8 @@ void test_sockmap_basic(void)
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

