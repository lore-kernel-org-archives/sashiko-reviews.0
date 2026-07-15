Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E33B71BF
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151348; cv=none; b=loiwHQdZiTflgtoF/e2KWHq4MYqJfmfEYZzOYKNVuVfmCyAQPfax9ebSi2rRFjSMlPMKj0XH9DwzRkG1rqTltQC7qvO4rQ7m8ro+L4aqeIZD2bUmXICm6zQe22MATWEjNnbWfjFMyo3ZAM2F1BfncNJNvU4w4BpNYzWh0K1Ufuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151348; c=relaxed/simple;
	bh=ZKOMyDoJ6g3UwcacRyDOPkw2zOY/wvzrMIe3bKIhxug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bg/Gq0EH8LbRHkg8HENxDHZx2QkJUzMwvAt+DAMs2d1PrVGLF59SZyHdGs8imaLRpnNbV8jKgfglVyJKOysRH/hM6RjUSXFCZmnYie9Oj3+1mKLbjLRFuX4xN50o+x3z8MsyQJgts3gTLSd6/HeefglhRB29NyGNq2w9s/21+3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpcHwQnL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpcHwQnL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4720f3bf164so705741f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 14:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784151345; x=1784756145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9ZjibRHTP77IoV3000xMUSYR9VstJ4TVfh1m4URAq8=;
        b=TpcHwQnLoXpQOyvHjKXshwzc0qoWgEOttfOdFCnZz5EaZUz5KVQskGraOmEh47IrPy
         f6G+/E3Hmg75vlBFLrVRsW/f9ts8W/yZankH98+EJXS88SFDR3pvgepRMMvmKyYwr+XU
         AIEdcolBl6predw0IhM9GM5YdhL53qXQN08Qew5359Vc0YyxQMbvfFuX74F1/8t3nnEV
         rI3hGO8+Rrtn75bqdNOPie8aok6tHQRWQgc2Kq8dKYKgvHHh/2osBjrRtcNvkUJdhmZL
         /e7iQczSAunLUfLJf2GYVHIJFUtK5Gmrk3ufAlCSEtXp6WN8bIr75rJS6P8N2L1G2Pjn
         OR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151345; x=1784756145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d9ZjibRHTP77IoV3000xMUSYR9VstJ4TVfh1m4URAq8=;
        b=Fsf18LD7A5REmZBcIdxomlOnHtBT3FaxiggH8YT4HwNzxre8NK8/+KMp09NSFcXxPS
         g2YekDe6EYqjVHb/PPGtB2AcQXcoMzw0DIOwKYhk2jElRB0IZgGEuNeQqT/JuAP572Bo
         y2rN2HijqR86yPagG03De1fnPbtU6gCQ/j0zd4PQrHMMxu5uRfJYdvZnPITjyuKyr8Jr
         Qebf7LJNlpXcnnG7P+4+Tvr0mH3KrmWUdSJiWaeEFFO4dbO2MylacmgZ/0DEGQCa1QPg
         4WQaQ5rJlhCgd1NeIANsuINHtn5BZVEpAwoaiujcjK3TA51O0wBqPBI70FViS/VjQHcY
         4vsw==
X-Forwarded-Encrypted: i=1; AHgh+RrdDeiyZWMu0fwG4Px0T5NXPfuix5LFbIRpVTNsMFJwlpYmXlxqzxnR74/Ut6zWy/GCLAa9CsF5v6YuULbfWSA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwydcSuIco0vaimYRTU8z9essOo7N1nxjuJ7eEMwy5/wDCB72Mu
	mCvywTzRW4L3fssWJ6n+mUvJS7VSzmc21aVM89YjBs/Jra3ThG9kDx+D
X-Gm-Gg: AfdE7cnNyqP3U/d0F8C7TVZE5w1wSz8bhzASuvdchTGNUqReyLshB3SgER2bBSuOw+R
	jocP6CkpjweLBF08qmCpI4QM2o7iKOTmoxYIXNxNI3hp2Mvkq9o92YYIP0POu7CueSMkZAkA86O
	a4WAWv5Oa6o1JEJ7Vh+xUrXoEpkKsKG4Y4rvECLvQFNI4GjZgw7njGj+up8G8NswOk0fYLvc1xU
	nwH5qxrIO6puENoaMJ+TVAeA7Vg+I0ZqYfa+VD0tDrqbhrZdnQRo0G93BuantQps0yff/Fj2IjH
	Nh5yKqK098NQtyHYjX5drNNVqRfqF1kCIQScwN1JMZLYlsN4Xsql7jYsPYM2FPfBe+eB38qj9NH
	JmbEQZCewFqJilNfXnwt6+OSbFdNcj7B+3cFGprySvum6O1hgtulB/yCBB5AJb+VGrPsAmwlSln
	SxDz/tTOVJLOyhQfv7XqIurIX4piph5SIt+2DqBog+a7atoHEinCJZTDMbE6Yv+89ygg==
X-Received: by 2002:a05:6000:1ac8:b0:47d:f6a5:1fd6 with SMTP id ffacd0b85a97d-47f55f06503mr1044251f8f.26.1784151344632;
        Wed, 15 Jul 2026 14:35:44 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635c86csm19224122f8f.16.2026.07.15.14.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:44 -0700 (PDT)
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: jiayuan.chen@linux.dev
Cc: bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	jakub@cloudflare.com,
	john.fastabend@gmail.com,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	nnamdio@gmail.com,
	pabeni@redhat.com,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v4 2/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Wed, 15 Jul 2026 22:35:38 +0100
Message-ID: <20260715213538.37229-3-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715213538.37229-1-nnamdio@gmail.com>
References: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
 <20260715213538.37229-1-nnamdio@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This selftest exercises the tcp_bpf_recvmsg() and tcp_bpf_recvmsg_parser()
functions, to ensure that they are properly handling spurious wakeups in
tcp_msg_wait_data().

The expected behaviour is that:

  * Without a timeout - recvfrom() does not return an EAGAIN error.

  * With a timeout - recvfrom() returns EAGAIN, but only after the
    SO_RCVTIMEO timeout has expired.

If the spurious wakeups are not correctly handled, the above assertions
fail.

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
 tools/testing/selftests/net/.gitignore        |   2 +
 tools/testing/selftests/net/Makefile          |   5 +
 .../selftests/net/sockmap_recvfrom.bpf.c      |  31 ++
 .../testing/selftests/net/sockmap_recvfrom.c  | 299 ++++++++++++++++++
 4 files changed, 337 insertions(+)
 create mode 100644 tools/testing/selftests/net/sockmap_recvfrom.bpf.c
 create mode 100644 tools/testing/selftests/net/sockmap_recvfrom.c

diff --git a/tools/testing/selftests/net/.gitignore b/tools/testing/selftests/net/.gitignore
index c9f46031ac73..a1840a5d45f6 100644
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@ -39,6 +39,8 @@ sk_connect_zero_addr
 sk_so_peek_off
 skf_net_off
 socket
+sockmap_recvfrom
+sockmap_recvfrom.bpf.o
 so_incoming_cpu
 so_netns_cookie
 so_rcv_listener
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 708d960ae07d..dd04b80725c6 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -191,6 +191,7 @@ TEST_GEN_PROGS := \
 	sk_connect_zero_addr \
 	sk_so_peek_off \
 	so_incoming_cpu \
+	sockmap_recvfrom \
 	tap \
 	tcp_port_share \
 	tls \
@@ -238,3 +239,7 @@ $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
 $(OUTPUT)/io_uring_zerocopy_tx: CFLAGS += -I../../../include/
 
 include bpf.mk
+
+$(OUTPUT)/sockmap_recvfrom: $(BPFOBJ)
+$(OUTPUT)/sockmap_recvfrom: LDLIBS += $(BPFOBJ) -lelf -lz -lpthread
+$(OUTPUT)/sockmap_recvfrom: CFLAGS += -I$(OUTPUT)/tools/include
diff --git a/tools/testing/selftests/net/sockmap_recvfrom.bpf.c b/tools/testing/selftests/net/sockmap_recvfrom.bpf.c
new file mode 100644
index 000000000000..fec470c738f1
--- /dev/null
+++ b/tools/testing/selftests/net/sockmap_recvfrom.bpf.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+
+#define AF_INET 2
+
+char LICENSE[] SEC("license") = "GPL";
+
+struct {
+	__uint(type, BPF_MAP_TYPE_SOCKHASH);
+	__uint(max_entries, 1024);
+	__type(key, __u64);
+	__type(value, __u64);
+
+} map_socks SEC(".maps");
+
+SEC("sockops") int on_sockops(struct bpf_sock_ops *ctx)
+{
+	if (ctx->family == AF_INET && ctx->op == BPF_SOCK_OPS_ACTIVE_ESTABLISHED_CB) {
+		__u64 cookie = bpf_get_socket_cookie(ctx);
+
+		bpf_sock_hash_update(ctx, &map_socks, &cookie, BPF_NOEXIST);
+	}
+
+	return 0;
+}
+
+SEC("sk_skb/stream_verdict") int on_recv(struct __sk_buff *ctx)
+{
+	return SK_PASS;
+}
diff --git a/tools/testing/selftests/net/sockmap_recvfrom.c b/tools/testing/selftests/net/sockmap_recvfrom.c
new file mode 100644
index 000000000000..25657fc3dbcd
--- /dev/null
+++ b/tools/testing/selftests/net/sockmap_recvfrom.c
@@ -0,0 +1,299 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <arpa/inet.h>
+#include <bpf/libbpf.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <stdatomic.h>
+#include <sys/socket.h>
+#include <sys/time.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+#define MAX_ITERATIONS 100
+#define PAYLOAD_END 'e'
+
+static int start_listening(struct __test_metadata *_metadata, uint16_t *port)
+{
+	struct sockaddr_in addr;
+	socklen_t addrlen;
+	int fd;
+
+	memset(&addr, 0, sizeof(addr));
+	addr.sin_family = AF_INET;
+	addr.sin_addr.s_addr = INADDR_ANY;
+
+	fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+
+	ASSERT_NE(fd, -1);
+	ASSERT_EQ(bind(fd, (struct sockaddr *)&addr, sizeof(addr)), 0);
+	ASSERT_EQ(listen(fd, 5), 0);
+
+	addrlen = sizeof(addr);
+
+	ASSERT_EQ(getsockname(fd, (struct sockaddr *)&addr, &addrlen), 0);
+
+	*port = addr.sin_port;
+
+	return fd;
+}
+
+static void process_client(int fd, atomic_int *running, bool *failed)
+{
+	char buf[1024];
+	struct timeval timeo;
+
+	timeo.tv_sec = 0;
+	timeo.tv_usec = 1000;
+
+	if (setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &timeo, sizeof(timeo)))
+		*failed = true;
+
+	while (atomic_load(running)) {
+		ssize_t len = recvfrom(fd, buf, sizeof(buf), 0, NULL, NULL);
+
+		if (len == -1) {
+			if (errno != EAGAIN && errno != EINTR)
+				*failed = true;
+			continue;
+		}
+
+		if (len <= 0 || buf[len - 1] == PAYLOAD_END)
+			break;
+	}
+
+	send(fd, "test", 4, MSG_NOSIGNAL);
+
+	close(fd);
+}
+
+struct bpf_t {
+	struct bpf_object *obj;
+	struct bpf_link *on_sockops;
+	struct bpf_link *on_recv;
+};
+
+static void setup_bpf(struct __test_metadata *_metadata, const char *path, bool recv,
+						struct bpf_t *bpf)
+{
+	struct bpf_program *prog;
+	int cgroup;
+
+	memset(bpf, 0, sizeof(*bpf));
+	bpf->obj = bpf_object__open_file(path, NULL);
+
+	ASSERT_NE(bpf->obj, NULL);
+	ASSERT_EQ(bpf_object__load(bpf->obj), 0);
+
+	prog = bpf_object__find_program_by_name(bpf->obj, "on_sockops");
+	ASSERT_NE(prog, NULL);
+
+	cgroup = open("/sys/fs/cgroup", O_RDONLY);
+	ASSERT_NE(cgroup, -1);
+
+	bpf->on_sockops = bpf_program__attach_cgroup(prog, cgroup);
+	close(cgroup);
+
+	ASSERT_NE(bpf->on_sockops, NULL);
+
+	if (recv) {
+		struct bpf_map *map = bpf_object__find_map_by_name(bpf->obj, "map_socks");
+
+		ASSERT_NE(map, NULL);
+
+		prog = bpf_object__find_program_by_name(bpf->obj, "on_recv");
+		ASSERT_NE(prog, NULL);
+
+		bpf->on_recv = bpf_program__attach_sockmap(prog, bpf_map__fd(map));
+		ASSERT_NE(bpf->on_recv, NULL);
+	}
+}
+
+struct server_t {
+	int fd;
+	atomic_int running;
+	pthread_t thread;
+	bool thread_created;
+};
+
+static void *run_server(void *arg)
+{
+	struct server_t *server = arg;
+	bool failed = false;
+
+	while (atomic_load(&server->running)) {
+		int client_fd = accept(server->fd, NULL, NULL);
+
+		if (client_fd == -1) {
+			if (!atomic_load(&server->running))
+				break;
+
+			continue;
+		}
+
+		process_client(client_fd, &server->running, &failed);
+	}
+
+	if (failed)
+		return (void *)1;
+
+	return NULL;
+}
+
+static int send_payload(struct __test_metadata *_metadata, int fd, const char *buf, size_t len)
+{
+	size_t remaining = len;
+
+	do {
+		ssize_t bytes = write(fd, buf + (len - remaining), remaining);
+
+		if (bytes < 0) {
+			if (errno == EINTR)
+				continue;
+
+			return -1;
+		}
+
+		remaining -= bytes;
+	} while (remaining);
+
+	return 0;
+}
+
+FIXTURE(sockmap_recvfrom)
+{
+	struct server_t server;
+	struct sockaddr_in addr;
+	struct bpf_t bpf;
+	char *payload;
+	size_t payload_len;
+};
+
+FIXTURE_VARIANT(sockmap_recvfrom)
+{
+	bool with_recv;
+};
+
+FIXTURE_VARIANT_ADD(sockmap_recvfrom, recvmsg)
+{
+	.with_recv = false
+};
+
+FIXTURE_VARIANT_ADD(sockmap_recvfrom, recvmsg_parser)
+{
+	.with_recv = true
+};
+
+FIXTURE_SETUP(sockmap_recvfrom)
+{
+	memset(&self->server, 0, sizeof(self->server));
+	self->server.fd = -1;
+
+	memset(&self->addr, 0, sizeof(self->addr));
+
+	self->payload_len = 1024 * 1024 * 25;
+	self->payload = malloc(self->payload_len);
+	ASSERT_NE(self->payload, NULL);
+
+	memset(self->payload, 0, self->payload_len);
+	self->payload[self->payload_len - 1] = PAYLOAD_END;
+
+	setup_bpf(_metadata, "sockmap_recvfrom.bpf.o", variant->with_recv, &self->bpf);
+	atomic_store(&self->server.running, 1);
+	self->server.fd = start_listening(_metadata, &self->addr.sin_port);
+
+	self->addr.sin_family = AF_INET;
+	self->addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+
+	ASSERT_EQ(pthread_create(&self->server.thread, NULL, &run_server, &self->server), 0);
+	self->server.thread_created = true;
+}
+
+FIXTURE_TEARDOWN(sockmap_recvfrom)
+{
+	atomic_store(&self->server.running, 0);
+
+	if (self->server.fd != -1)
+		shutdown(self->server.fd, SHUT_RD);
+
+	if (self->server.thread_created) {
+		void *retval = NULL;
+
+		pthread_join(self->server.thread, &retval);
+		EXPECT_EQ(retval, NULL);
+	}
+
+	if (self->server.fd != -1)
+		close(self->server.fd);
+
+	free(self->payload);
+	bpf_link__destroy(self->bpf.on_sockops);
+
+	if (self->bpf.on_recv)
+		bpf_link__destroy(self->bpf.on_recv);
+
+	bpf_object__close(self->bpf.obj);
+}
+
+TEST_F(sockmap_recvfrom, no_timeout)
+{
+	char ignored[128];
+
+	for (int i = 0; i < MAX_ITERATIONS; ++i) {
+		int fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+
+		ASSERT_NE(fd, -1);
+		ASSERT_EQ(connect(fd, (struct sockaddr *)&self->addr, sizeof(self->addr)), 0);
+
+		ASSERT_EQ(send_payload(_metadata, fd, self->payload, self->payload_len), 0);
+
+		if (recvfrom(fd, ignored, sizeof(ignored), 0, NULL, NULL) < 0)
+			ASSERT_NE(errno, EAGAIN);
+
+		close(fd);
+	}
+}
+
+static int64_t to_nanos(struct timespec *time)
+{
+	return (time->tv_sec * 1000000000LL) + time->tv_nsec;
+}
+
+TEST_F(sockmap_recvfrom, with_timeout)
+{
+	char ignored[128];
+	struct timeval timeo;
+
+	timeo.tv_sec = 0;
+	timeo.tv_usec = 5000;
+
+	/* remove the payload end delimiter so the server never responds and recvfrom times out. */
+	self->payload[self->payload_len - 1] = 0;
+
+	for (int i = 0; i < MAX_ITERATIONS; ++i) {
+		struct timespec beg;
+		struct timespec end;
+		int err;
+
+		int fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+
+		ASSERT_NE(fd, -1);
+		ASSERT_EQ(connect(fd, (struct sockaddr *)&self->addr, sizeof(self->addr)), 0);
+
+		ASSERT_EQ(send_payload(_metadata, fd, self->payload, self->payload_len), 0);
+
+		ASSERT_EQ(setsockopt(fd, SOL_SOCKET, SO_RCVTIMEO, &timeo, sizeof(timeo)), 0);
+
+		clock_gettime(CLOCK_MONOTONIC, &beg);
+		ASSERT_EQ(recvfrom(fd, ignored, sizeof(ignored), 0, NULL, NULL), -1);
+		err = errno;
+		clock_gettime(CLOCK_MONOTONIC, &end);
+
+		ASSERT_EQ(err, EAGAIN);
+		ASSERT_GE(to_nanos(&end) - to_nanos(&beg), timeo.tv_usec * 1000);
+
+		close(fd);
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.52.0

