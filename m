Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C0377A98
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 08:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694852; cv=none; b=oErlJTlvE1690y3UIbdVzFktitkQTljj7uFb9Q/LQMraFt9JshI4Pna0CJC5Tw1lJRYdokwzrZZudjPZzp9+zjn+U/FuFTv+wRW05Lne6ZtEPD+zSKJIcw+CU4XK3j5M8a85gX1gTLiWfpch1nrJublRJ94ATS3TdMcwAkCuNdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694852; c=relaxed/simple;
	bh=C0abIehr80Wpjf52fM2FVTg08DwwXZt69KjDeV+3SPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avBue8S6DyoKTEs9MLyeyQj12lH0W7jatuqdbIMvpGdsKGmnnkiM3eL6XkNfZom1rFipz9Q5tbPWMduV1gmQtDRZ/VUS3P8XuxQGapVB5/x0JrSwi8mpKd9feW9SqBAzti0+eO9DIK/tTcw3HPsPSNM6VMDcncGZgdRucs2fmCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dq+PyDpt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dq+PyDpt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so6915235e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 01:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786694849; x=1787299649; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvwtzarQ/dYBS7JL1ZitrxFtSPInVeBnSLoYHJJQBl8=;
        b=dq+PyDptsaz7njZnuz/Lvdnl01/K8vTzG22YfhWJEBS/y6s8VlmFuPtyqixzXCEyme
         McJffuwRWqFSg9xA0bbKF6hp/U25Uxz/vjVvrgRcWV7vbWKPqowFVC7d7AjX4+DxYXpG
         k3n94zQmDkn4sqDAmI0aGY7TAP5uQDwNwhpzOji+cBj2N+ZpSlV9lL/Fc//vghIsPCev
         nWZzxAwFALiuE0eIU5X9AVGKDxo5R1QTMUbVsA2PvEW/BX8RpQLXc8lKHjTAZXUBOpek
         SiqYtFpHwDoCBzSTt8x13WmcmpXW2ByJLQpRI6YNwTpBjyr/jCfuC7VeQmc+nXrO7xdU
         Z+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786694849; x=1787299649;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvwtzarQ/dYBS7JL1ZitrxFtSPInVeBnSLoYHJJQBl8=;
        b=Lfdc3uivVqbU0Md5ntOLlNYm1Ud//zOM4+z1psG9H4Hdp2p4VA9KPUos2b8jGheCog
         s3jSLcD6M/8QwaUccOSUXdYBlVLoDhcTqxK3WN0RAtAsZqn/tjAe4ocKfAZI/1ULcSvR
         ZzGW64du6jinhTc/ZKB20fWVwvAAv+TYMxrkipbGbtYifMXZRda/12+t5UfsVwcvkK5M
         HwMFuZpdsIBtnpIZTKN5rW4cQIswfz20o5XT5IjhdpmlSXNZsDNKLji3NjSdYgSjAMf4
         SDc2raUY3jy2CtSbCB2ZjfIRcfQKMhHZ0we+CcW3voVI7ET3bOE5/OayTOxFCon+hT0k
         SH2A==
X-Forwarded-Encrypted: i=1; AHgh+Rplprs+fa4tPVgUxWA65zI938S2dqgyeaGzmB45glYgL0BU1Fr28D/sQKR7Gz9TOwj0NLi+MZYBM/N0RM84QVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQUbqZgi/FZctIY05w1GCHHgFAAiBD2RVfdBHSXx4v1iVW2Mc+
	Z1Up7f21qfLXnQIHfrZVSFEqs4BMcYhPh2Im2+sPseHgE2tuAQbN8EpuripSLj782A==
X-Gm-Gg: AR+sD13ElXPGJJxRPuXGEmyqpjPsrjwhp92vZ1Q5OhukX1lKX0yNaRmpJU+0I6u9Y6O
	yaMOLknBmKPzfiLac7fgU5HjCrK9wbR6ZL0W7fw6WgNQR87Ri/qms5frnO2BzfGiFdTrGydRdpg
	KPHba7OoJ72A76nzSGf0tc0WCYH3hoPj/fM/yUChitQ0kNp0e9WayrtjDY1cWDq+RuMWlLxF4CF
	o7iDFspCpoDxcMIMPuGUEP3oO2d1vuJMyEu2bMrj1yBB6Z2I7vieyPJCydAMGleDf8P83X0ekRc
	99SxqFFWbrJav4YEKv9p2SSVr+9+byCD2P8C/UQJcGX8x+nlFJm9Gm2dXLQQwvmj8a+OaM3KRti
	VxLPxyaXHR5d0BA+MyTyYZn1n4EIR9IL2TIyNl0rtV9g03W9z8BXoh/gCTQZdTSqyq56jBVCMQL
	QufZ94zaBZ0dzECsGVwbCfwCVKGtP5QKVbofvZf+SHQt/YQ0EcmwHv+8CO6f5x+QsgQaj1Ma14e
	JKTtRHUcxByCFlyu1W3/dosk3KsF3K0
X-Received: by 2002:a05:600c:c165:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-4998795bca6mr60329945e9.8.1786694848111;
        Fri, 14 Aug 2026 01:07:28 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b27bfsm6056643f8f.23.2026.08.14.01.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:07:27 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:07:23 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/10] ring-buffer: Make nr_pages unsigned int
Message-ID: <an7Muwh8LgL0_v5h@google.com>
References: <20260813131152.3589632-1-vdonnefort@google.com>
 <20260813131152.3589632-11-vdonnefort@google.com>
 <20260813135526.EF9CF1F000E9@smtp.kernel.org>
 <20260813214156.64d0b21a@gandalf.local.home>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813214156.64d0b21a@gandalf.local.home>

On Thu, Aug 13, 2026 at 09:41:56PM -0400, Steven Rostedt wrote:
> On Thu, 13 Aug 2026 13:55:26 +0000
> sashiko-bot@kernel.org wrote:
> 
> > > @@ -3264,7 +3263,7 @@ int ring_buffer_resize(struct trace_buffer *buffer, unsigned long size,
> > >  			int cpu_id)
> > >  {
> > >  	struct ring_buffer_per_cpu *cpu_buffer;
> > > -	unsigned long nr_pages;
> > > +	unsigned int nr_pages;  
> > 
> > [Severity: Critical]
> > If a huge value is written to buffer_size_kb, could the unsigned
> > difference between nr_pages and cpu_buffer->nr_pages overflow when
> > assigned to the now 32-bit signed cpu_buffer->nr_pages_to_update?
> 
> I agree. I never wanted to limit the size of the ring buffer. If anything,
> I would want to make all references to nr_pages to be long. Otherwise we
> are capping the size of the ring buffer to 8 terabytes per CPU. Yeah, that
> may sound huge, but believe me, in the not so distant future, it may be
> desirable.
> 
> I'm fine with keeping persistent memory and even special case mappings
> limited to MAX_INT pages. But not the ring buffer as a whole.
> 
> -- Steve

So, keeping nr_pages unsigned long everywhere but -E2BIG for the cases where we
are limited to 32-bits, that is persistent buffers, user-mapped buffers and
remotes?

-- 
Vincent
