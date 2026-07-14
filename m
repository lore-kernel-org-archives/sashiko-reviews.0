Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33339CCEE
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 20:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061582; cv=none; b=pl0xhHR8MPUR45MpeSXAVc87uDJ0W1VXWxZtKQuFQV320G2pRAH275NriW/T6RL06s0gusa4mn49I/6Ok42WVO5OrYP79eXXIPFioMv5tZP4/n4w+liNT/LZfLKfdqlLBWAxHtujcVnbPKQRISz7xsH0SlikDhgDlal3IY0wL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061582; c=relaxed/simple;
	bh=p3ty0i+wWfdktVq9nRg6b13I6JNyf7ok7A0AV4/xQ6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROV3XBJMcWwujajIyCL/0KSThzuRpg7fe6qKVapVRjWnx9aMfu/tBdBLiJJBPgXH2S1Wde1jGbT+l8Gmwx1AU5vVsdHOTgDwm7+nQNzVNqUQxNolJ2FzlZL0YF2R/kZjzX1JLINAVXkOWkdZboG1bw0yn9iO+Jt5DKpDWgEkA0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxFkqmky; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxFkqmky"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso34176385e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784061579; x=1784666379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5D2M+8JC0T4UT29HnUPeI2z7I2/miIRrXwPjpYCuscY=;
        b=BxFkqmkyq8/vU5aO4sLqzTTGpSSTxibQNKIEP9Ij2WibJgQzbZIP8Z2wSXiGy84c/P
         yy7Sj8HjHRE8l3qYM7WvFRUrKblzmGp0zB0qkFBAdiUxPEH3oUS5ZSeqgBvu0BErfnz3
         jWiZcHu4LDlEoRbBFNLVU1Kmnsm2ZuMMcopHuICtknzzTkdqscDGmUHL0jGq6XplyLF/
         axPJBqHe4/psaJS8lnmtcvpv8CKNkh40FV6V4CNe20OdAi/DASQ/olg8+Ns3StPoOAsD
         ao5UcNP7lBrjHtDc92EXjvS9iaqtVHmxXNXxp94DX5hubZbrotNN/OXhr8yXhO83bFPb
         ErJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784061579; x=1784666379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5D2M+8JC0T4UT29HnUPeI2z7I2/miIRrXwPjpYCuscY=;
        b=UZLJSIbXOwBUGTllJRzUoSfPY6eJQ0dOeW3OIzQy1y33hZInwZCk4Cob5rm3kC0nAh
         44rHK+1C3DD+nYWgWzQ0aBnYPBsqvlYe1MFdPtb1aKJ3ck5r2A1g+G2EZfSmYuPhEeSq
         znMeHX6tosEJFtTkmi7L/e3Dpk+FX/pYWvQbkPHEoQAXOtrmJ7PmgIbu46YC57XyPMZk
         xXdmhdEd3ZARCRDFT8Pl1XRWBcwiwl1atf2b6oip+FM6rtq1Ydf/t63vIdRFHT+or/AC
         nEbu+JgyHtNSIB9LCmKEKVj5hMBEklXNnUWSsJW6hGFg11GHStJ0O0ccHPtGlbT126Zy
         lJ3w==
X-Forwarded-Encrypted: i=1; AHgh+Rrd1WrDl/2DhD6QXx8Q1n6EUj0VxVDSVwrCYrwE+O6ya5sB/kuCmdHEUzAHXaVsJtsNloy7h4J7sIkKUW3oiQo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzchDU4YqR479GRjzy+n+eXMrxOaM6fbsNMUm9A0BAkVkBs7Dhg
	uLj2O1lvHn/8NRosM2Zci5v3IHAdOrR0172gFX14ekyOSoZS9UO8NDe1
X-Gm-Gg: AfdE7cmnKJ6RZhm5zQ9Jh3IiAmG8BXYOeWQg5cI5L61ycUWHubMQrhPjdqZul5wG+aN
	7mRGy8HtByfdpER+VQQQXnbKe5MPrtF5Zr8DQT/SRDCDPnSG4Rl4qC0jEB+HiEa2h0EqplUhgJ7
	TLjwZjDBbXaQjQiIPfFSdNqSTMp701HY8zcz8IcMpsf5KLEHZGkr4H2IkZoQKjJ/36+4MPiACFV
	TyO57Flycx0y89d13ESf1wiNWzWiBUol0f0K12efP/jVp8XVh6nfn7eSqp01a0eregJRd4MOvXA
	u/q0EIAwsDc3+Hv1RIhaIspHdg2nvEZiZw7ybT7fgIVaeuTifVRrD0O3C5cp0sC8pWc5RZ5Zc2D
	gHGVJfzLCXG+Wxi7gFUDlJbrJMVaPpwCr3TvhTHkHAEHTvV5dDskec/e8wu9LdhWrJ4ePDplWr7
	KDLWkhsxIu+qzlsp6TVEBcqxhMrGMN1Cy9xvsby4J3S6u5Mr64TGg+p1rDc7lMvj5M6VDryq6EM
	EERt7uy+9/heT4=
X-Received: by 2002:a05:600c:283:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-49518306db9mr41584185e9.27.1784061579422;
        Tue, 14 Jul 2026 13:39:39 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32c65asm98894115e9.14.2026.07.14.13.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:39:38 -0700 (PDT)
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: jiayuan.chen@linux.dev
Cc: nnamdio@gmail.com,
	john.fastabend@gmail.com,
	jakub@cloudflare.com,
	edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v3 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Tue, 14 Jul 2026 21:39:25 +0100
Message-ID: <20260714203927.32289-1-nnamdio@gmail.com>
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

Changes in v2:
- In tcp_bpf_recvmsg, handle signals and the socket closing in the loop.
- Fix spurious wakeups when SO_RCVTIMEO has been set on the socket.
- Link to v1: https://patch.msgid.link/ak_rR-Skd8Mvn4mH@localhost.localdomain

Changes in v3:
- Added the sockmap_recvfrom selftest.
- Link to v2: https://patch.msgid.link/alFRK66z45eDNZA7@localhost.localdomain

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
Nnamdi Onyeyiri (2):
  bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
  bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup

 net/ipv4/tcp_bpf.c                            |  55 +++-
 tools/testing/selftests/net/.gitignore        |   2 +
 tools/testing/selftests/net/Makefile          |   6 +
 .../selftests/net/sockmap_recvfrom.bpf.c      |  31 ++
 .../testing/selftests/net/sockmap_recvfrom.c  | 288 ++++++++++++++++++
 5 files changed, 373 insertions(+), 9 deletions(-)
 create mode 100644 tools/testing/selftests/net/sockmap_recvfrom.bpf.c
 create mode 100644 tools/testing/selftests/net/sockmap_recvfrom.c

-- 
2.52.0

