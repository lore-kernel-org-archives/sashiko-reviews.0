Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A5E43D51A
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784567744; cv=none; b=XSkkDLcHChMA3jEujTBKetb0vWJ3L0+9pklVtI9kisLTnW5IVCU5O77RAiob7hs7bvjVRYPFaH/mUkQbd8XDWmSjRbdU1B3Um64tRA7u9XqgIjyxFdNmKFWtVD7Xi4YFCWUpEnjjvlhQIkEvcl2UI+7KhJU2H+FnWBrN3HqcGgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784567744; c=relaxed/simple;
	bh=aotS4eEfRpVStcxAhOhiA18MzhLy96mjpdyq44LYXME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OnGtu8zMnAsgJn4BqIXe3ZktUwTRvLbPrJwHMjvG6QwG8QGIhpi1mHe8sPsUP5d/yXMwwUrXhL24hB9D7QiYAlCGHsJ+ynDu0nvD9K6sQcqJX4vvn5SdHaD9Q/lKwBLD579nMie9JV8VwRYtPhHZF4P6Fg5CRVKU9mHG6Ab9hAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ7Ylhfx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ7Ylhfx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956242332dso7928885e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784567740; x=1785172540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMzyY0w2hvyVLQCy4KUYX/zX5WWoesLqRMdPQHdI44g=;
        b=hJ7YlhfxSUFpKbrRxkO1JMHoeW/1TPfZtcNQ/62FYGX12NvDO6xZDK1Gvt5Mrd3CBS
         aVbyC3DYPOaELnyPdUQJxzq3kYvCaoW0/K0M6/df2Q8eTa9Wsfe+6iWjzX62X4WJZ4xG
         4LuIlpZxIJqK92r1RBvqSiHOrscxlm39OG2zkHVXW3jgLtG1cl5MzrLsf3qONWJALB+p
         MrUbGJLV1HqyePF0F8q11ziWPlHF+J1hC+22/jtxkxO0CycTveLxVAy6btyogEIZJ4YF
         jG1X5pj/dq5t40T4G5bqgK5vBcIU6mzXPVFnKPhkZWD1+QZQwzYlKoiQOjfHjM0kyBLU
         QuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567740; x=1785172540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMzyY0w2hvyVLQCy4KUYX/zX5WWoesLqRMdPQHdI44g=;
        b=eHZ+qU4Bpex7dLDtZlKe+qpEbYQJNxcYJ9uN2qLqsn/LZG6+MXAziQRyV0Cj0WWXuD
         XhSerCcvZPk2BFvH+D/5VzsnazJH+fI5+aqi13PtqDT1L9iGoRClp1YeClGNiH8lriRB
         +Gt6XVjPXPzSjPJOxDeQYhqysshjIMgLBlMI6RJ3cUAQ1PIcxpqV2+7/bdu75RypIrkt
         MkP/6pymi4aQcSOUk3x1IA1AfPNbHhEzABYG47QLk3p+7wNdkbDUHzD6M/Y3NsjLGWUH
         FI95D4QVjpLrguu0ZLI9EIA+IPN4Kq3JRy16xL19Rqy7v3kBFb2AyxL4Y/sNDqTwk8GN
         jgsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqY6i6+tD54pWRi+F3eH8aOyTvvyY5lJ3Z7u3pk5jQjh9Z3UeuIWXG/DONcJsX+PrSC+yiIXPaGVpzIPV+3vFQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7eez7zSYd6ig7NfTuFShtxeWWGd1McbL4Xqh8nE4Kbk6ijQXn
	NXGf+l3JFaZ9MX9AHdUvQYwPWv0B6MNjxZqXwpbrU+60G/DztNCu1aW0
X-Gm-Gg: AfdE7cmcbQaR+WMuYUpWGTtbPuqbYJIprbM4HbU66EHiVHhCkzCcyrICVdj1ZFK9RGH
	WmCxdP0Ru+W+4eSTBPW/0H+1N+myJljcHvPaTVmxA2bngu1NwyNEzwrdpTjCm9+loRpXz8VdFsx
	GqlGbcduAVDmDselRO10VuZ0LqC9fuO7Fn6tw97BKA9372DOFGvm+O5rcalndP114WFf8j5YdrV
	eTiMvotWszPnM7s+cX4Gc+fm4fkMsNhjbmIWOHtdN/q+lHCRK2+AVNaI9SKaoqivG62LmAquT6R
	v0/6IIs9S3KAqwydUny544JRfA4yqWwIGj+wmZMd2QuGP9e8FqSSmwdnpcyFiihiFWIY9IZGYgW
	asW/4VQIrQltu0xbmngafiJhgAuz8TsLatNYGRCbMd/THcDQQ1UJnVu10W/3Xho9CrvwEMydEpT
	NzpOo9DoqbjaruyvkZkImqKC/fKMXv/hVKS3xpokgXxAfTyXfYexHq1IZ7O24di4yevQ==
X-Received: by 2002:a05:600c:4f13:b0:495:4fd5:570 with SMTP id 5b1f17b1804b1-4954fd506eemr130115115e9.4.1784567739453;
        Mon, 20 Jul 2026 10:15:39 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547af7esm2304865e9.8.2026.07.20.10.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:15:38 -0700 (PDT)
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
Subject: [PATCH v6 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Mon, 20 Jul 2026 18:15:33 +0100
Message-ID: <20260720171535.67867-1-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spurious wakeups in tcp_msg_wait_data() aren't being handled by
tcp_bpf_recvmsg() and tcp_bpf_recvmsg_parser(), leading to unexpected
EAGAIN errors returned by recvfrom()/recv().  Adding handling for the
wakeup and a selftest.

This issue was first discovered in an application that adds sockets to
a sockmap as a way to view the received data.  No redirects or any
other operations are performed.

Sashiko has noted a few other pre-existing issues in the same area
(https://patch.msgid.link/20260714205118.17DB11F000E9@smtp.kernel.org)
that can lead to EAGAIN in tcp_bpf_recvmsg() and
tcp_bpf_recvmsg_parser().  A local run of Sashiko also identified a
potential issue in tcp_bpf_recvmsg() handling zero-data FIN packets when
the MSG_PEEK flag is set.  To prevent this patchset from growing too
large, I intend to submit follow up patches to address these once this
one has been accepted.

Changes in v6:
- Closing the file descriptor in the selftest worker thread.
- Ensuring the selftest loop breaks early for an error in the worker
  thread.
- Added comments to selftest regarding focus on EAGAIN error.
- Updated selftest commit message to imperative mood.
- Link to v5: https://patch.msgid.link/20260717155348.54975-1-nnamdio@gmail.com

Changes in v5:
- Move selftest from net into bpf/prog_tests/sockmap_basic.c
- Link to v4: https://patch.msgid.link/20260715213538.37229-1-nnamdio@gmail.com

Changes in v4:
- Fix potential data loss in tcp_bpf_recvmsg() when a FIN or RST has
  been received.
- Check the return code of pthread_create() in the selftest.
- Fix race caused by using EXPECT macros in a thread in selftest.
- Link to v3: https://patch.msgid.link/20260714203927.32289-1-nnamdio@gmail.com

Changes in v3:
- Added the sockmap_recvfrom selftest.
- Link to v2: https://patch.msgid.link/alFRK66z45eDNZA7@localhost.localdomain

Changes in v2:
- In tcp_bpf_recvmsg, handle signals and the socket closing in the loop.
- Fix spurious wakeups when SO_RCVTIMEO has been set on the socket.
- Link to v1: https://patch.msgid.link/ak_rR-Skd8Mvn4mH@localhost.localdomain

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
Nnamdi Onyeyiri (2):
  bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
  selftests/bpf: add sockmap recvfrom EAGAIN selftest

 net/ipv4/tcp_bpf.c                            |  69 ++++++++--
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 124 ++++++++++++++++++
 2 files changed, 184 insertions(+), 9 deletions(-)

-- 
2.52.0

