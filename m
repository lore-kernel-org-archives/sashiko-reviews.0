Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CBE3FF1B4
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 11:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659051; cv=none; b=Q50VEpd149OoeVof9SlDQvWsMKlAjTuD7MHkYorWIwj/s5E600e4iDTadkCqciplAL2wDfqIgQhkwPNS5qsogmYmLXdza/MP7KQoJONx5Lt8niQTZlWgZlssxdazqgaDcgt9LRpGT4/eMwmYA/os6me9f7lDqlBZt41Jw0T5i9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659051; c=relaxed/simple;
	bh=j5Afy2as19W32q8jX2j1wSb9qr7wYiWdDuuQVS6+rk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UBF+VhLu9brO7g3vhYEnWor43r6mNJ+//DNn6dx8YyHPMO24YqK4pgqnGBJKWCMz/4UvB/T9TvzizNt15J4R5vTu8ywj1S3sEqX71uUcaYUCWiLMv3OWuXA1fMdt1sbi/pHwb+exIT35mttaI5kuRfew8wNRhxLkGSRB9ViS+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEg2wCvK; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEg2wCvK"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d032846c95so55591915ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787659049; x=1788263849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j5Afy2as19W32q8jX2j1wSb9qr7wYiWdDuuQVS6+rk0=;
        b=BEg2wCvK1PuIEOmzLLWFSFEX5i74twdY+ZUnJRZdZmSeTN3gfOdB4sA3mX5/eDnqi+
         /NmIjD2gJzd/Izxfe/E0u/BUI7vjKsyNeFpLJokibBsly6w1DE/3pSIe/jOvv21ChTG5
         Ejfc2gWMLctMoJbqHxEUqGwap/Fb05pfH0dLH2CbVCEc+jC92u1ZSloMcPsm+VmnXtcj
         1KJy93RlOfAFOFpCs5iSCWsknhaKU8SJ9Df9Ht5cm6v+0gQ8woEkAaMbyu6JzR2memHX
         h3DWOHIp3AeMb+VuT7CPge9uEIQgKycg7da/0raozP1BopMSJ+cmharl4oCCOOoDorfW
         28xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659049; x=1788263849;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5Afy2as19W32q8jX2j1wSb9qr7wYiWdDuuQVS6+rk0=;
        b=fBeRLXEBk4G17ppJujTJ/5LeeFXI6ZjigELHGSBlsPpsqsPGc6m0T4FqUAqVDZ3OMH
         BeE8NGQC136Z/+Zpvf1KPpCHaIXkf7fWcKKPWYQ6+VTtpnBqgDN1aUmQztjCI0zm5tIY
         MaKWrrMB3MpwJl8UvFcOrTA693+EYHbhHHRv5S97R3ETuMU1ev/Zq6xZ0KINtxEgZvo5
         kemHXnWlMSytqsqMvTHs6OQhgZ8U8jTpPcGG/XXuhvUHPoGqWIvYK9d6fBkqW7WU7XJJ
         +dZESW1LaHY++zQsJdvc2SiYqp3I1nZBv1bQb+ukuFvWmuP6i2M4a/886oms+tEjiM0t
         j8kQ==
X-Gm-Message-State: AFuF++nk5rF4DXBl19z9fmLjWZ9JWTX9SxcKdNwGqCBMAyBdWxvQxPWc
	83ML1tRDcL+UBp5wFsEX9nZHXaM9UJS4YR8Wdpug/PhNDqVe34p9XKwXRF9UgQ==
X-Gm-Gg: AR+sD12jhB0RDBaVMWZS5LNDoh38QsroR4pZEz0hCI9FYWQGoJgTZ/nU9F/SP0fZNj7
	jVOjhDLTficMkkm872rHbxaih9Zj5jgP4yfckxZJ9OHvffr2kCD7nBwhebvQIUzxHSLVL25PElN
	ydmJwuU3ddD/HRKk2bSJQN/kpnlXA3M3Z41LUNh/YZ+FOvlkqH1Rx7m45dlYIpdYXunhB1kAK4w
	G7KO4vPH+GBemcQDcZUaV252akL1ssdRN20oBb+U0PZq/QtuOfMpfK10dJz+nnpEAe2uD3oVRIE
	wGGmwrFUmeDuhMTv3QWPWgcD82hj8xoMSyY2zHGdy9R7e/leHzXIsrFUfAVRUuV7zboNGBjQYuw
	TfaYgACR6n2Ar+n44od5Q4AuyrB6f4bbnsrBBVPgHIlJNutJoyjP+eL45Nr1hgHPjvo2YMSFXUI
	QSKFhBz8imveePsQOGKdCWHc/aEdpVjiEISqT5tyXBuPtt+lP4flU5phowmkbVRBT4PttKpyFzD
	/QDPt7b4THNWFntXgk2rca2
X-Received: by 2002:a17:90b:520c:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-395c3867ac5mr65374029a91.14.1787659049210;
        Tue, 25 Aug 2026 04:57:29 -0700 (PDT)
Received: from localhost.localdomain ([103.120.31.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d37cesm41861522eec.15.2026.08.25.04.57.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 04:57:28 -0700 (PDT)
From: Khawar Ahemad <ahemadkhawar123@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Subject: Re: [PATCH bpf-next] bpf: Fix stream capacity leak and spurious -ENOSPC in bpf_stream_stage_commit
Date: Tue, 25 Aug 2026 17:27:21 +0530
Message-ID: <20260825115722.85375-1-ahemadkhawar123@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825113948.85020-1-ahemadkhawar123@gmail.com>
References: <20260825113948.85020-1-ahemadkhawar123@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Sashiko reviewer,

Thanks for the thoughtful analysis. Addressing both points:

1. Regarding 0-byte elements (Low):
A 0-byte element in BPF streams carries no payload and no delimiter
(unlike NUL-terminated strings in userspace, streams are raw byte logs).
When bpf_stream_read() encounters a 0-byte element, min(0, rem_len) is 0,
copy_to_user() copies 0 bytes, and the element is immediately popped and
freed. Staging and committing a purely 0-byte stage transfers zero bytes
of data to readers; returning early when ss->len == 0 safely avoids
unnecessary atomic operations and lock contention on stream->log.

2. Regarding the rollback path and commit description (Medium):
In normal sequential execution, ss->len > 0 implies ss->log is non-empty
because ss->len is only incremented upon successful element enqueue.
The if (!list) rollback check is defensive programming: in the unpatched
code, if list was NULL, the function returned 0 without considering any
capacity consumed. Adding bpf_stream_release_capacity() ensures that even
under abnormal or future decoupled states, capacity accounting remains
strictly symmetric with queue state.

The primary immediate functional fix is preventing spurious -ENOSPC:
when stream->capacity is at BPF_STREAM_MAX_CAPACITY, calling
bpf_stream_consume_capacity(stream, 0) returned -ENOSPC due to the
atomic_read(&stream->capacity) >= BPF_STREAM_MAX_CAPACITY check,
incorrectly failing zero-byte stage commits.

Thanks,
Khawar Ahemad <ahemadkhawar123@gmail.com>
