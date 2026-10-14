Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C220499F06
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984621; cv=none; b=LMlQ0aEuNkFcIT6++zVOOA0LbtiDcNwgB34tQMrrK0+i82K76fJnnByVQsM8A0uKb6J6P/VIyQ1cqGkmHijjkx/n8XK2nftq2w4z8TBJhgNsk9ZHTqPKKKMjhjqOh4BsDxYMZRdsN1Re6jDGPVCwfTIPzIOXXvyJ00Zv+FbWmzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984621; c=relaxed/simple;
	bh=mhD4IKfkuUbyMU0v6DEvobnYF3a1AdfM7IAhJ/CNqVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dct+bc4QMT+JyLvfVXY/uwQ8HFREEgyRbLpUkhSoY+FRXO6uvMtlUBWR1IdXnx1vG2kLwt2eRKC8wLx6WIB8fdq7g4zJeU/MXaEfEXq5qbuUYIN2KY8LUYSW6K9zyQerUv0HH9rIN2rmM0yVo5IPQs9y1VBzzJcN3yFsKU5IPZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCl8qSUw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCl8qSUw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so274244a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984613; x=1792589413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mhD4IKfkuUbyMU0v6DEvobnYF3a1AdfM7IAhJ/CNqVA=;
        b=CCl8qSUw0TsvzPvh/EWek45lDXmiuW6OKgSoVZA5OhSgj4M+SPvKR1aqaeHrX07Ik3
         iwpy+xebykpJXufAtmYE6EcruNI7SCyVqdaUhvaPoG7iplDYfvdXbcOUvlhauUxRChCE
         1RPFUeLdFib4gfK73eHhPuaJnTxwDK7xTxCdZNHJveR8S8X+4I4nGPYC9n9IH4ECxFFC
         hGN8IdSE1d/gniOvv6GOFrGy0tBCipJGf4ASTAxkAlQOSK63JengFrV0x2mobzrabGtQ
         j2CuLKkDf94yBCA9CuE6orQHsu+gxIMtOfYBN8WA0B8MASd1RcpkbaQgqLJsk1K3PFTZ
         Ps8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984613; x=1792589413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mhD4IKfkuUbyMU0v6DEvobnYF3a1AdfM7IAhJ/CNqVA=;
        b=IUdrh+Ro797USXrBCjBG+BK15NuGptSfKMOWQe3GBk7XRQbjuuKQWFDgRCD8kFDGo0
         PO86ygbLWytmW0OaiEL//8sKTT02981QQ6SPNSybiCaXqeBPNN1gVhIwwQ/KVXyElW55
         VB73EIVW7CSBoRQ4zbi+DtKni0XHBc1QJMrmirSkBUVfvdV8iyasDP7kNR5fdwdAj4T6
         yIYEQC7EkDuHhNYXWavpt7pG1tH2zI+4XkEf1mH57SqmwxQIYQnEysMX/qdB0oo39wr4
         SV2/6Tnwh6tCTfCvNWZgDFz8wpWJsV3sRJSGo3RladzbdLiF/cmsBCQ7j0SS9dktfDwN
         Y3CA==
X-Gm-Message-State: AFq9FYJeHnmgp2sTd4y9MRC3zE+vs6hmHO5nMYQOP58GigbalD0Y4wyG
	c5V4ErQfzEHBoLXxcJyxcQsK+SKWK9gb49kYZ7Sao7f4xah4ql3I1VFm
X-Gm-Gg: AYBFou3aBkiUP7NsvZBoki2lhLwgT2Cdk74XNjEg6/O+tE/62cafHIG3VG5wELRQItk
	VQ3Kj9/KR7rteIBYOgSbNiUho+1t0dfdfIusGTN2qtDFArTFkhL27S3+wwx+/Ytn1kwEymyZ5sK
	wqonLhcWiRgHpCD0KsYDWYl51asZXBkhqhSIm83SCYlJfwRCLyG4CsgeA5pKPx84hNX7lgt6hjB
	a89M7aMHodvEZ/RBjigkDoIaXbecnAfrmrMps4bzZC1/CpkS3Aq5wvK/4SWhKRqh+5I/j3OdW3O
	fb9IZPUharJ8ucE+8jjOutl5HtjARU2TxmsNyhUoLyhBwoBK/fOtMOu9nux0P77Pssrb/wv1fVq
	/MOMZcsid+b+mHg/C4YiQbsRCd2PTB3eQXjZ5EbLbXyC/cx1KqT23bdI9wh0AcyAnBZz0g4tX3Z
	K3cKGUVmWgeH1uPyMQbTaH4AYc9XS5BfiWGP9LCJvWbeOf6KIAPnOFwsCqShUadAYQnsByom05r
	OA/YTWWKhLl+C/bWr7LrnV1+WAdHZA/4Xg3jwGwrv6QPmXeigUjMmIjd2GT
X-Received: by 2002:a17:90b:1d4f:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3ab3a91173cmr13060295a91.18.1791984613094;
        Wed, 14 Oct 2026 06:30:13 -0700 (PDT)
Received: from C9P9279WY4 (206.135.124.34.bc.googleusercontent.com. [34.124.135.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f202aeesm4800199a91.5.2026.10.14.06.30.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 06:30:11 -0700 (PDT)
From: Tian Xun Ng <luckilystar08@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: sashiko-reviews@lists.linux.dev,
	netdev@vger.kernel.org,
	Emil Tantilov <emil.s.tantilov@intel.com>,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	aleksander.lobakin@intel.com,
	aleksandr.loktionov@intel.com,
	decot@google.com,
	milena.olech@intel.com,
	joshua.a.hay@intel.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Tian Xun Ng <tianxun.ng@bytedance.com>
Subject: Re: [PATCH iwl-net v5 3/3] idpf: keep the mailbox up while tearing down vports on shutdown
Date: Wed, 14 Oct 2026 21:30:02 +0800
Message-ID: <20261014133002.99917-1-luckilystar08@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <sashiko-outbox-171247@kernel.org>
References: <20261013121224.84482-1-luckilystar08@gmail.com> <20261013121224.84482-4-luckilystar08@gmail.com> <sashiko-outbox-171247@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 12:13 UTC, sashiko-bot@kernel.org wrote:
> - [High] idpf: NULL pointer dereference in idpf_tx_start during shutdown

This path is not changed by the patch. idpf_vport_dealloc() skips
idpf_vport_stop() and idpf_decfg_netdev() while IDPF_HR_RESET_IN_PROG is
set with or without it, and idpf_shutdown() has lacked the stale netdev
cleanup that idpf_remove() does since 4c9106f4906a. It is a separate
issue; I can look at it in a follow-up.

> - [High] idpf: SW marker consumption race causes cascading timeouts

The set-then-wait order per Tx queue is the same as in the current
code. With the default split queue model each Tx queue has its own
completion queue (IDPF_DFLT_SPLITQ_TXQ_PER_GROUP is 1), so markers are
not shared. Where they are, this patch limits the effect on shutdown to
one 500 ms wait per queue set. Setting SW_MARKER on all queues before
waiting looks like a reasonable cleanup on its own.

> - [High] idpf: DMA memory corruption on slow CP during shutdown

This is the trade-off discussed on v3 and v4. Without the patch,
shutdown sends none of the teardown messages, so a control plane slower
than 500 ms is no worse off than today, and a responsive one gets the
full teardown. On the tested devices the queue-related messages took at
most 240 ms.

Thanks,
Tian Xun
