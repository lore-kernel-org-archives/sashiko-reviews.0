Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1552371043
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151346; cv=none; b=DQf3e7cE+zqLwfgGRmWLt55tct1K1IzBCEzLUtrB82mUXK96kJwimkxzJ4vGVjO30IrIf6eB6N9Q9UVzg0XZK+KofSUsxUalYuO33rLpon2Uf5+r7q9Gp85SXSTiOkY0q64iS2h+qjoWjOVHM4ZuPBUkHUDRi74wBK36yVH20TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151346; c=relaxed/simple;
	bh=H06707SCcUEpQKy3SuFkb5jGYwBixHq8bDcyFHkpNwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjwM/D66p7FsrIFOquHH3U9iOmjtTYoah7CQgZClhYn4zJ/tHgZ8ljzHhtEUQaPrbJlsCnB69XQsuYS0ZJxE5MKIIDcryoYUv2U1CD6OGJYvOYiNFWt6tk0lOEHM64hZjRjlH+oPklgDH0GBkPrlcx3+XIMKl1v8DZGnDmg+Y9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nj2SX5l7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nj2SX5l7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de0093c42so2159995f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784151343; x=1784756143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoPbLUiXGDVybmpDf9ldp04oUouyQ+e8sy+2Axcu02k=;
        b=Nj2SX5l7JCIlaJLiVXlVi53iR4cxg624nppYG+7BTNXfHjCiwrtOIu1AXR0jALvR69
         RiPIw8Vf//31s4bc6DZkGypZ5skiv1ey7BCS8gyu3ZeRn/XStO28ea4XO3LEY5iWaOZW
         bcVIwZ8kyCtd8xKlSAL1qhTFZdygFlyhegcMOzp9buPs7uI7xIeBHMkvjTmdyRd9lWYM
         B/GGkB0kL5nioBovWMviGd3UDA/bg7KEqVeNhOBBlQGdX0mJc1fczowPzCRBRVaNoMUR
         kxH6PsdVa9pFGHCbIPPnWbbfmcUgQnh73rFCYdLf+aAmKtHssWrounO7o6Ar13DfzBQj
         viOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151343; x=1784756143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoPbLUiXGDVybmpDf9ldp04oUouyQ+e8sy+2Axcu02k=;
        b=O/ce5lF4KooBiMq9KWeaGKyhLnrC0MGJygtjU5adx2y/kNeCNd64IABnezkZvahJZK
         ZWBtc5CLd/coWX9h/ulorVT8WQfctpwdust5xVw6PlxoZeW+D7UcEF7lvYdOl3yyN99U
         7QBM+fcZ/IrbEOlbgaYbFvg+AZWyIDfcVb3SbZDjj2ELN14Hs22FAJh9qquXvr1FdRSU
         vDj3PvAFt2Zz8XksCuiiQnRZmUr9Ll1956StByK5cILsgGJuxSThkJuBtGjbmVu4PZdc
         RuWvg2ruRh/eHXNXc0HrarSwxXmJfNTsVfymeJBXnOWnl6ARwLr1PG6JP2DHrbXy9biz
         VrbA==
X-Forwarded-Encrypted: i=1; AHgh+RrI/09ZLrYLkY1qeEgH+l4jQCoT9WBQJGfNJbW5tmRN8rOH/bm330BiVWihwkVbmaFw40ldd2R012Dk/jEDNaM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5ES1c11x4oyvF07ectVVu+a404xiLFsLwn4ALpt9riFqJ1PUh
	XlsXuPADW1I2MGlWp8gTx8xd4BUkv+PhVzuqSMAA/dzeqpWR86PGjW3r
X-Gm-Gg: AfdE7cmlFv6yus7awoIhX0wErpSA/vNN+/fmIBumCUlLM3MuoB6AHEt3MK/2kVmz8Lm
	haAaT9QiJUQrSItM9G2NCLYQ1uGtnqczKs/5LUmTqDMVHjFLfxp85xBjYCfr5fHEbIsZMg2C+tB
	8xIx1e8gpIsESc6BbPY/3fSpAnptZ7kFIT53KxjtyuUs78MysidAFgj3fCpKK7jlMReSEfDdpsP
	D3eprS2wekdmf72NdZSkstwx41v5E/cZNipXxVwQMYR7e8Xokyjp/FNBF289gkP6FAsW7zMeXYW
	jkFXT0d8xndl52Pxbbh6yR8Ma9VlkKDfRLpD/SE5j8EQEdr1+RYW/Xpx6k15alFcb93Dlfc5m8N
	D1vzALazyYGOHADPKAqnHFTsfa6qM9wfK026DKTr2YtqGenP9Jc+47ptVuZOzJkORcLvALzKID8
	MDYdNVQpLM6QXYbgenevjqgX2isqbsWpMUBQac9zv2VOaDcbKbRlE2A8UA2ri0o65lUedoqS4RX
	WOu
X-Received: by 2002:a5d:5f51:0:b0:47f:51bc:efe2 with SMTP id ffacd0b85a97d-47f51bd05bcmr4660373f8f.11.1784151342782;
        Wed, 15 Jul 2026 14:35:42 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635c86csm19224122f8f.16.2026.07.15.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:42 -0700 (PDT)
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
Subject: [PATCH v4 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Wed, 15 Jul 2026 22:35:36 +0100
Message-ID: <20260715213538.37229-1-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
References: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Spurious wakeups in tcp_msg_wait_data() isn't being handled by
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

Changes in v2:
- In tcp_bpf_recvmsg, handle signals and the socket closing in the loop.
- Fix spurious wakeups when SO_RCVTIMEO has been set on the socket.
- Link to v1: https://patch.msgid.link/ak_rR-Skd8Mvn4mH@localhost.localdomain

Changes in v3:
- Added the sockmap_recvfrom selftest.
- Link to v2: https://patch.msgid.link/alFRK66z45eDNZA7@localhost.localdomain

Changes in v4:
- Fix potential data loss in tcp_bpf_recvmsg() when a FIN or RST has
  been received.
- Check the return code of pthread_create() in the selftest.
- Fix race caused by using EXPECT macros in a thread in selftest.
- Link to v3: https://patch.msgid.link/20260714203927.32289-1-nnamdio@gmail.com

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
Nnamdi Onyeyiri (2):
  bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
  bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup

 net/ipv4/tcp_bpf.c                            |  69 +++-
 tools/testing/selftests/net/.gitignore        |   2 +
 tools/testing/selftests/net/Makefile          |   5 +
 .../selftests/net/sockmap_recvfrom.bpf.c      |  31 ++
 .../testing/selftests/net/sockmap_recvfrom.c  | 299 ++++++++++++++++++
 5 files changed, 397 insertions(+), 9 deletions(-)
 create mode 100644 tools/testing/selftests/net/sockmap_recvfrom.bpf.c
 create mode 100644 tools/testing/selftests/net/sockmap_recvfrom.c

-- 
2.52.0

