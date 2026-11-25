Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598328;
	b=ww4DKzefEaSTRkee2kDEVGT1Brlb9kuNJ2XNj/ja2AJ719WQCWyl43SKCi2wzmI26WH2
	 IqNCDzo+FQQhD7oISN8n+limdKjXapdFoAA49Jzo+mRdklrMOf8EIavXRzIEci6IEKANC
	 /ZO462pVu8oveaw9t30Z2N25dGjzrtIGhHCBNhcb+6VS7ErzPnYAaVrKx1iJrGVEW0+Fq
	 Roj01BHkKnmnl8Pc+uT+QIq/pbrkxiIHj2JRfHw+yujAMHs2bg/Ym2LT7Q/bkjA+ZChmA
	 dEpI7jAeDvu9LAjthSjb0AG/L/u+kCyQbchauxkK21+lWoqbFd9R5hrXKAumO6uSuoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7h2E6/RXXaN8qvTmARnXOrgPNEtAf1zGpXXBrvYlAFw=;
	b=oKE2aqFPjlDJmo8jkiZ+WNGxgEHXgAT6sCldcKHhQtk3Bu3IBXJ3wW0WDp5xMUJpF7fs
	 fpZGW74FycgpSyHCZKF3GnfMFexyq8z1rd3HFKuHoGedleuxnsrq/NisPy7YH/RBm3p8Z
	 m9LhxUpc32cxcwEAq8wZEE5oRRjZct/oQAmB3Lwj54HlPs1JJcfjnEgpr1s20vV1HDsKC
	 luqDKz5CGmW7LcSlp7dfp029KzFwa+M4oj+Buw2Mlz3ovzxBONrRJM5n/XmoHSRh5Tcxz
	 eotDbEzxSiLQO8uH1nijIsBDBG/wrJhxL0KnFdfrgbi3+K+YskqRW5ZJir+IGuNosWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Z7bJbGjC;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C5606A333
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 09:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9C5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Z7bJbGjC
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so50344985e9.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 01:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795598326; x=1796203126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7h2E6/RXXaN8qvTmARnXOrgPNEtAf1zGpXXBrvYlAFw=;
        b=Z7bJbGjCHkHBzkUx2zIJuL3zEa/VxjXh8ZarU6lAURfzL+2N3BKxwcx0zfUZg0xQyO
         XNev0KjmzCFvIhmW1egJFNIKUxJQOK3R0tnTWS3D/gLUABIgS+pVy00nLfteRb0TqCU+
         26zjmaIRbKf3xLCYWsnvD49QYg+QAgwxn5VvqG4TSvRqHlGo4T97GC1RYAMXjXY7J+4r
         dSQFq2099gzdP9nn/7+gYJotOzKGgp9ox4ZjRMVkyD6W8cnY+nSWNN7EqnOfsg7+T9Nd
         O8jMaFujlxciVu+jRQT0NWX+vaL2eV7IMlKXwBKL0P+Z5Un3T5kxgorEYIQta+OVfe9Z
         et5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598326; x=1796203126;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7h2E6/RXXaN8qvTmARnXOrgPNEtAf1zGpXXBrvYlAFw=;
        b=1oAKUOjvUSkLvE1DoYJ9rT17dEKIGWZBokpGjGcdJGku0JKn0phEMs9lc894MKm4cF
         wV2EpIsK4nGnshdRQeHqltL4eH1JY6nbC49CmjAe7J+jPksJYPQZwr6f3aoHxG/ZlGXr
         TRjHqPnhf+64qLxkl4oyVCqvSrnaPk3OkNH04WrqK9YVAC6KBA6BnLTc1IGFydNbiJ4o
         /zQLWMUiI/wZVb7BlRs/67Zs7tN8CkgJNccYkcEGLgWBZlsq5RSOs5/0E6pxa5ySi/R/
         8k1Ttd+atyTYNSNJ8CFBZpg4I/1GZoFXrdUgvjRDhteY8Fm6TkaZ7Xf6vABvXGRNnLPF
         NXKw==
X-Gm-Message-State: APuU4Z/txj7cGFbsUmVm+wdLSqksDxa4OfYEpobgOIzuZ9+sDHQt99/d
	ctpVIfkGSPYN7nZqoLqO/HacZIx/SzOHQHIM2dlMUsc7r6unC9xeQJW0u+XJgn+x05FP0cqI/Os
	w5SmA7w0=
X-Gm-Gg: AZFdTZfiNI8CJe4qHZR8wM/gLnPAjIuI58eYn6y/7Wj6z9bFqOmT18ybCjyET9MjX4B
	SbLSbaUVCzXJ/eL4zmBkpIHwL2WxAYhP25N2OCnIi7Vk8kuNp8l1yHAadU7jXa5MWkDpvCu3y/3
	Zonfmrgfoewh//1FsCO26Ht0dAwEaMtkBHoVu4vaJ2jpB0TFdXU3k7F3GhseRFvqatUkP+BonML
	5HFrR3NLnktPuo/T8XNeIh+Eb00/VLbbPtGGF24GBZbduEaqI0eXCfvKIwHyv7AaIartvDgQ34G
	F/b3sAKwa6GNlJlkqVgQV62JVZ53Nm+/5+DH0GOXWHOCssPWe2OLkA5pABrQ2vWNfZ2UHuSbG0V
	MwmKCBCvb28kN1Y/cmAEKjgYRR4b0gkM8xDyQqdoo5s0n2/OO7aH9S01JsKmDtk2vcuN05U6OGu
	7+mc9i0HuIAvx1oAN0NATdsFbhED4V6lkUgtC0NrdSfCZoYwAqzYkce8nKPWWJjXtLmCV6eROdj
	vqP/KSe5AfeaKvLJKw6LaA//frL1lYwRB0DU9Qv7y6CcZkXEVRsW+eyWGz767M456ntUdeNBaWF
	kg2jJcdQLGY1MGr8/IM=
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb88820bfamr364901185e9.30.1795598326473;
        Wed, 25 Nov 2026 01:18:46 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm16850149f8f.19.2026.11.25.01.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:18:45 -0800 (PST)
Date: Wed, 25 Nov 2026 12:18:42 +0300
From: Dan Carpenter <dan@pereq.eu>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	linux-s390@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1
 when resetting a vcpu
Message-ID: <awan8mSx5cbzXzJ7@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
 <sashiko-outbox-232760@kernel.org>
 <awam4std0Zifdn9k@stanley.mountain>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awam4std0Zifdn9k@stanley.mountain>

On Wed, Nov 25, 2026 at 12:14:10PM +0300, Dan Carpenter wrote:
> Let me add the s390 maintainers to the CC list.
> 
> I considered doing it the way Sashiko suggests but s390 doesn't have the
> __vcpu_assign_sys_reg() helpers so it broke the build.  The registers are
> not the same so, either way, some of this is going to be specific to
> arm64.  But Sashiko is correct that s390 probably keeps a stale SP_EL1
> across a reset.  The s390 maintainers could probably take the selftest in
> patch 8 and modify it for s390.  :)
> 

Actually, never mind.  This can be done in kvm_reset_vcpu_core() like
Suzuki Poulose suggests.

regards,
dan carpenter
