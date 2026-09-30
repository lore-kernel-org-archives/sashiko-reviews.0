Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A519A4E77FD
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 18:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793525; cv=none; b=FeFPPUeBEMWYs5hHgzRAeRX8ICTujbio0m7Vko9B83UD4cUMHs95dyg4ljcK04NHyCRnc2+tuOK1GxqnQZz6YDh/LLLT6M7amxoingzdtOWJXArLMAM2SJJv0R62p9AJ63sKGTpWB0QngSVtTh07fZCLMFxX/5f1vykOCSkIOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793525; c=relaxed/simple;
	bh=qIYeVUCO05ZbZhdAAAoZexxaRjrSKWkj1JQrUJwwZr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+thLkxxXZlhjQWMKKj1D7kjmiIZVJr1uQhMZFeNjhZApeCnpwAjwrpgQ5qTMgCdBgiK5O1EZAsdDn9ADNqLrrg/QA9S+MihdiP6rhWPwzkefIfIWj8lqOzngPzJ3z+20JGQxYsHtG6XCGsrubsHY8dDCwLjnCvgkOpXg4lssGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmHj7Jwn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmHj7Jwn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so9716985e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793522; x=1791398322; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X/kW+42sSDWDUbw6VMWjlova15EUzqflh+DF1qz2pHg=;
        b=NmHj7Jwn2/pQdWScnlxY+p6xRE/jugG41XByf1vDN2+rTY69gc6Mqf8ZrEopYZGCn0
         pnlACQrdf8R59HwAfbZizqKtVBhgBIXENhIILBygJ7HjSJnL4u4jZ6iI7QuXE8PjnTZl
         JamMB73NhNvB4u1bGjz/dxAgW6AhA19aYtR5plKXYYm59mgCnLB3gWaLKp/kp8XoaUX5
         CJYEv8ppeu4qZAexvQP0BTciXlRpFf0ABj3oGABvGrNNrH+2SJu5b3euK3WuVJvDJDZL
         bd6Ckn/1yw5c5KVv4mYw0uHRW0J8/SSIA9az4hl3kJoohiNJv6KfnbD4H8rJoLJ9hk/k
         AiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793522; x=1791398322;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X/kW+42sSDWDUbw6VMWjlova15EUzqflh+DF1qz2pHg=;
        b=2BvBk1eO/eShj/tbIk+WIh/2Gm8VAc4g4piT+on6nlbw4Mn9WVBWxI6DvFuNB5u01Z
         7daJMpNKfaEezvNu72RxSLoRIklucgNJtpLQVBu1ZtHunB0O2GCgXc/tgpFpgil/bfB5
         K+Yn8wZpuAiPTieoQQbrAWUgbSKVJxoigcEXAGpnR324ottfG4IEVq/F5qETIWziOk3F
         s4n3Ynu/fwPiuTWneLrojneXGl/FZEfNYk1hTzx2eSpLTP1WaqRnxshBbr/Le3igHb4G
         IkB6kNJ/JiAD2p4CtrjBKbg8rzLW+gig9YwuK5er18wGJ0xJThRCOMaQffdFW8UJyE8o
         9ZEw==
X-Gm-Message-State: AFuF++nwEUkxvG89ML+wRHCkerg9RABZb8FaSJ+pyzgTRADAXLuPxkn8
	ViXQcrALp++oKjxocmdaCVrJGEnQzTlx/5EtrXS1zTZ41vFBy0XRo6elCbogabVh
X-Gm-Gg: AYBFou2Mj1ENHufZd1r6BXTCGJbmKPm8qUq4+fRmHpTDxgAMuz6ZcFi4H8WA2Ep929V
	OntQaJs6t5JMxTPhhOS6p2d5W4hFH1DVmawgRoMBq8GN+X1E195ZNJXKdIfMVg8qxBBTLA2kysu
	t7ckDB7UKYZcHdXQZIjwWyvHtnK6W5RzpdH9r4DZ+arYDhjO4xzRUcSsIROwzcklNMiDnR+GH5Q
	VtNR8prfR7MZYWOQ5UOLcQ5Qi0T90Ku5cDMX52/DVHxDAE4FZmeubgpeeVMPJcB9gJgUW4GcUGz
	XT7nvadu6y1+Blny40PBdU2abcKSq6H6sYFXv/TZLfAwUJBfR4L4EABktTqGURBWcUC5PyuQjm5
	pWXaY0b4W5F3S//iC08cxVw66Eu3dplWEr/WauJU8EqNxTeMFKVHUXibMrV8rLgHwKFRF4ziXbE
	xuDRMHnfKEEIPv5BrkbrvEZk8Jy4c+ZLE3KtumDlVB7uGC3C37FNhHGrkPkz0Uat86VUuDdZ3LR
	fS8CVuiDDfNc/qgrwQ1oK4p+Nx9rQgMr2d0cgMSGTw//U3VIdLNpaPh8jFjCk37iQEr2TKrnajn
	Zzp0fvf2GPMmJ55hghKyW2VIRbEfKXHZnEpWvlSqsbt99TuyYuLqi0Z2SefAVNBEr77/tSL6eQ=
	=
X-Received: by 2002:a7b:ca5a:0:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a01eb19ffdmr6267285e9.17.1790793521692;
        Wed, 30 Sep 2026 11:38:41 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2b3-0101-b51c-a607-3dcc-3979.310.pool.telefonica.de. [2a02:3100:b2b3:101:b51c:a607:3dcc:3979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f979bbcsm1867795e9.5.2026.09.30.11.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:38:41 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:38:39 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	netdev@vger.kernel.org, sashiko-bot@kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [PATCH net 2/2] netpoll: avoid blocking on the transmit lock in
 queue_process
Message-ID: <ar1VeFD4pTgsG0i0@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
 <20260928064239.32456-3-kmehltretter@gmail.com>
 <20260929064307.569CE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929064307.569CE1F000FF@smtp.kernel.org>

On Tue, Sep 29, 2026 at 06:43:06AM +0100, sashiko-bot@kernel.org wrote:
> > +			schedule_delayed_work(&npinfo->tx_work, HZ / 10);
> > +			return;
> 
> [Severity: High]
> Does this schedule an excessively long delay when encountering a transient
> spinlock contention?

Yes, HZ / 10 is too long for transient TX-lock contention. I've changed
it in v2 to retry after one jiffy. The existing HZ / 10 backoff remains
for a stopped transmit queue or NETDEV_TX_BUSY.

Karl
