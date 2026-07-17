Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D405C314D35
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303635; cv=none; b=XHhDql9w52iRyubbAspTmXjxyw0HRg8BBWl914T/2NUvRzsZ9/hI60hrQ2o4OdFB06wrGwPNmOjxK1jGLFvYHvUzFdsQjxDoTHirirjvxFa0OEaTrzGoPc9zzntkXaCDDQi3bd+z3YlXzn89k/53GcrbYPDIH+04zEIOmHy1wWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303635; c=relaxed/simple;
	bh=YF9Knm40lON0FlUgiurO8Nd3SbRk4kttQ+DtP+b13jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EI6PnRgq6aC7KLb6bKEPCTQBTB7mQtQyqZM+aoN7v6zrneTmrSCmaS3Y2VT4PX9A6BQI0fF1rgeyoBrcUW6GSI/Er7PLdJkOtenjFq8xrUMlcDlNwcFWJxtVyG1RmNLTTWGzpZ9PiYmdeV1NMXB09cXElzX1eOmyA0uIJSxLgfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qztXRpko; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qztXRpko"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso4411598f8f.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303632; x=1784908432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KgKTphT/EPBidWmUJpQky4fuu3ayeXNP41GXKcwaXpY=;
        b=qztXRpkoD9QaCtsv7k/PTpJeIoyQSfwJBIvthln4njNlbrSo+aumH50ic1GckSdPrT
         fKa7S1rVu9/Gz3jjAg4R53Bp+NCd4g5cLM6S8Ji9Z23KczFmykbRxJLsgK/LZalTSnOC
         3rIjUdvpj4lNnISEL1Ygd1VZ8BTrSi56NxzxPH9jZ1lDSMtYiSMiaFbjiDHXqYy9NsFs
         SLo/CTDIoyTAZqzB8ZwD0xbeZbkmMVQTsQVq9a3Vm7YUEfmMC4l/h8vMhCMiE+2aos2v
         L9A+fcAyx2EvW4ge/2K/3RprDUxtlRdYgAW/Z+6GaB+Rp8cbcbNNg+wGGyO+SPYBoN1Q
         EISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303632; x=1784908432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgKTphT/EPBidWmUJpQky4fuu3ayeXNP41GXKcwaXpY=;
        b=DFhFmiGrJIbjPBc8rK4lP3mHOU8Vdm1TIWEPB07NLXeufczZZS2zZET4DrNj0IkrVl
         FkieAsYyYeH3H69GD6QjpYWy9IPyk5B5hJ80DBcyBPXQyylVTFtKwgG2k4fdJ041GQs3
         8KylfemODVME5vnKap02d9Jq3w62Ad09ejFS9Y7Io2UNSVYBefgWbYJhmJrqKRoZmIaO
         y8GCJaWGFbLnScF6ER5TXfwWmPF3hhYQaSkoF8x9smeUnFCoGxbNMp5DgL4QsjMLEzTX
         7lgPD6CHax0hneTwCWIP5vrMmuIYnTRryaDWLSZNwYxe2W6kupO1HIgMqs9iuVR0cyN0
         G58A==
X-Forwarded-Encrypted: i=1; AHgh+RqRNe7d9fXKwvakg5c92X8O7iMlbMhzSUjqyEK9erXk3cT2i67dVHxiqJGY7HjBot3cnAekBhkPcnmOqxX/f/E=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFF6CvslYHFxq6tM2eMnJ23DuewTTuZnYu+uRO50Hv9DasqxJd
	HX04A62UOK/le6aM4yjOYXG77BYuvOZtwwWoZMWFIQ7lteNm2Wv5Wd0G
X-Gm-Gg: AfdE7cmDVXUt1dhoWyi9TLzqn+1QeToquTqg6huD1e3j6h23TFPwxFQAraKm6FazYjE
	KFGoeb5j/bGXJYX6Ba97Qu4YqDM5JNDIwcrZHlvv98UwJeZMYDiN/6Wez1u3FLlpvxqGyoP6m8v
	7K8x6WRPx0bxM6jTCUcHnUu7x9ikCCduzJCJWLMlsOlczqc3Q5SQLZOjD+qtJdk5YJGwBFjY8/X
	s2eXCxK/mjN/u1bFBNMnQkqGJg9OgC59FeTcbpLKhNxmq6peTH9QHAn+kk0B/4gO7r2pkBN2Qwi
	n8l2EBX7EOjt8pzjYIRVgZU47cZqaa/d190lFciNbErrFzqu69g3nhCS7GEKQXoOXQdwyFJM0iw
	ig8qYzgD+hiZs0zLAnUUvC/CFbKrb48dmgcKHdCD4j3gYetFJoUVcAzSG43H5yPuycfOlu1F1or
	0FW2euYMfuJb1c0IoTcJsNjNSAq2HR/tPiHDRt0i68yDjSf2psvYU78kI+hNPuCfP+Ag==
X-Received: by 2002:a05:6000:2213:b0:47f:59b4:3933 with SMTP id ffacd0b85a97d-47f62330c15mr4105029f8f.42.1784303631863;
        Fri, 17 Jul 2026 08:53:51 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edcf8dsm5321369f8f.27.2026.07.17.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:53:51 -0700 (PDT)
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
Subject: [PATCH v5 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Fri, 17 Jul 2026 16:53:46 +0100
Message-ID: <20260717155348.54975-1-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
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
  selftest/bpf: added selftest sockmap_basic/sockmap recvfrom eagain

 net/ipv4/tcp_bpf.c                            |  69 +++++++++--
 .../selftests/bpf/prog_tests/sockmap_basic.c  | 115 ++++++++++++++++++
 2 files changed, 175 insertions(+), 9 deletions(-)

-- 
2.52.0

