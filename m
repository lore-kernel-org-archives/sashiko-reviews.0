Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F5346771
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784673502; cv=none; b=ZLFLf+MG2xreurooYDEjJbWr98zD1AwWqdD/LLhjpIM5J/3mquOjW2kNek3BH+X6LJY9Khryk1YLduHWXzhQjOFvP1Yfs6U9I8q269z9rRC2Y1HoEs/chP4ERZq6gRI3I7fxtdaAjHMr42YVwOwidm2GdHBwzOkRgXtpoe5K1Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784673502; c=relaxed/simple;
	bh=JQ6jy/Liue8WW5wFfNIdvfNn2mNrYwM8ygCatIkUUQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LvC4QfVcIPukpzNil632naMcanDzPjanWBcopqqeB8pF/M7w3Z+GDMV/9VeBRHNsk6z35HGrYbD9WBOmLP8uOrCpwWDR/3WIbUk/z7Hb1q7Amy3QC1klaLjnxgr+iMoP8xOE5wOy6UteJOsaE2QJmwjFoLEyf6BmVrPfODpfitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwWPTquv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwWPTquv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so18085015e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784673492; x=1785278292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLg62SoAvmrp+34mR0N76mbDra0q9WddbEhVc9/YGR8=;
        b=bwWPTquvI/SRD0BHG49QBCSdoXjdDgmmgq30fomRb4x5ylM0lK/lEoo8qMbRAIUkud
         2xeTiHDdUss3vW3k9qD7VVmGi0bA1WztXqW/1GcOuZjZdkWFBq915EZ3cDzCfXb78sOH
         ajdR+OhtYwDEhClBQ9m5x0CEpRtzLMruR/PpIfvuA1Vxf5hjPPnO0lQ4C9zOtQq9SCJn
         DMxVXuZ1RgmacYqcwUAfsI6q+lb073Ew+Z8eOzNRfYnRvomuxgwG0D/k6yoJo30oSVV2
         J0XPxmVetORVBMjkhX3o3lFFbMSH7R+xAeTpVcqYOH1VGSdpLicscXAkj0hSJV9Doyma
         bRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784673492; x=1785278292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLg62SoAvmrp+34mR0N76mbDra0q9WddbEhVc9/YGR8=;
        b=RQwy3TDz80ssAUKNAX2MJshTEzCG/RqunoeB2v4cCR1WalWFQpSkBrQZmBcUHRF5u2
         ZhNyJ9jO4lvkDt64dB1LJYDKd4CzwvCnzc0xCRWtoLPqXojtq+PcpgCryKm5fHwh4A2A
         ks7a+3GuAZIbRLl/DDCbsYhZC1wVacTuZn05dXi9AdqMvBNziGe0/9/KtaMnxcbmXEzP
         2N6vu7EN76iB0lfivIpUZHvxC71bz1JS1ucThYyD0mJimbNDQlj9GXO1+d/ntDImCjj5
         k1mO4Air6BnmVTk8uEU+NywQzyXunfTRh2T25QLBTHTSI34/uo5GdJFklVi9hkGvL8sL
         Lp6w==
X-Forwarded-Encrypted: i=1; AHgh+RoAM9dR5IBIQ2wAe0/hVu2OsqgW3KGfSTsacUERnTF6jbharhmOZIZi2kbR9aTjOR2gRA4APWMHEEAbrrBCH98=@lists.linux.dev
X-Gm-Message-State: AOJu0YxT1RVnn49o++2nJN9cI156UBE1JmoSOl2UQLrGvpDc9qgUzQLT
	9RVjruX+OQjD5kdZPeTCHjL94zgZMIvBDFuIeiXDT/mF91F43FN1B3fD
X-Gm-Gg: AfdE7cktitUPb53i5KL/LPmm1lRZ/UvBGX+GFc0p/Il6LAWKjQQF1Qvbziq23426lmQ
	4vhSlqqJt4pnq21DWhXnlVP36DcC/QWGzFbLucuBEu6QW9N9lx6+/syWtJlwx0beFU81+XmdQAA
	qKboAcETL1WpIXxwlUdlsZUVJLuJ39OFWq4k3Yr3Qoubx0XOKC7IOl7qeeu3tWL8BqZdmUIbnNy
	2S05b4PcHzDtch5OJKR/EIxrwZmr0RlFFPQcns529yQuijHKDKr0rWgtqraHaE7x9FwTDdh0aEC
	AttdbmHqHz3TUWNQqn4tAFxIKyGzHU8hfAe6x7esUEZDN39KDEpKEPhUxn0t9Uyx7lE6xGnR+o+
	rUF/8DRkpSn4vwNslLD8ZBKI/0KWFocZhmc+YqwJsfrdIpi8EMGwjIvVBBH//XBvRdNOfvP53lL
	k0VgnfVgLz/0uRP4h99YI0jMfubpE6O/R1w+0OAt5POCsDJGOKtCzDx450Tk57WkH2dw==
X-Received: by 2002:a05:600c:3143:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-4954a3d0cd7mr246829545e9.2.1784673491644;
        Tue, 21 Jul 2026 15:38:11 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm101290455e9.12.2026.07.21.15.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:38:10 -0700 (PDT)
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
Subject: [PATCH v7 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Tue, 21 Jul 2026 23:38:05 +0100
Message-ID: <20260721223807.75101-1-nnamdio@gmail.com>
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

Changes in v7:
- In tcp_bpf_recvmsg check for data in the TCP_CLOSE, !timeo and
  signal_pending branches.
- Refactored changes to tcp_bpf_recvmsg to reduce duplication.
- Increase the number of iterations in the selftests.
- Documented selftests numeric constants.
- Link to v6: https://patch.msgid.link/20260720171535.67867-1-nnamdio@gmail.com

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

 net/ipv4/tcp_bpf.c                            |  72 ++++++++--
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 136 ++++++++++++++++++
 2 files changed, 199 insertions(+), 9 deletions(-)

-- 
2.52.0

