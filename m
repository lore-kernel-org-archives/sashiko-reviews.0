Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633223;
	b=HgZHwKs423ssgFIhBfZmOnJ9cR3grrxHAo2XnczMvXR4o7aD1X2cCkSU01xVUb6a9WyZ
	 jfVS7y1xqOXW5c0xug4NwVp9XqbhrGxDBE/SMogNTm6yAk0qG1hlX5HNkwYvWkznWoXE/
	 jSinF2TVWSV80V0quYMxwpwY1Wzn9iv4gD4sORvT1RYj6WvTOb0u2g1t8MYzvFyFMx6Fu
	 QX6DKLWoN7tKJKsLjvsRsgcsjlB/UtAdT8pMa0U/mT6b80uBe/BxE97/Yq7DM6ldIaXYF
	 2Wci6ydapLN5/7fCkhWSJFmFzW33tFDMYKqcwSNLNqitrKNG85Op7HCLS45j2JuH6UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hBo6eoZILf9FXsA6KADnqw6aBIyY/61Jx7TtUC5p3AU=;
	b=iwc9798Qc5kQ0DQLT6jgNYcFoLk2mswSNYJWkBDo6bKIrgn9K9ZcN5jQFt8vwq2z+Iwp
	 wkLw85tPAmex2DEsLCtd5RC3VK9wEkQcWHfgcl4qM8xGdAhkShCKPZA4SdI3sL0f0zCyK
	 pkI0jMU39HTymvOm1krz2p6fWPsuPXo+tDEBuQ45Ds3py8DUfHnzzV47JvFe1ggY1gr8C
	 IcpXvXcgHibm3Dw7DjtmkY19taoFJEt0PD9opmmd7UHGkXgqQ+/oKPDoETdEPOxDFyq1k
	 FmnXzBNZl2XgESq0jFVe29AhAMMrqCS11KM/iuOVfFmfc15lD758DkpXPPuVCHQahIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CN64yhyD;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5976083EAE
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 15:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5976083EAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CN64yhyD
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so2647776b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 07:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633222; x=1794238022; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBo6eoZILf9FXsA6KADnqw6aBIyY/61Jx7TtUC5p3AU=;
        b=CN64yhyD1LvmfWARV0nSVxRPsmL3aknKHj8BKNkNXkD9Hh4OdZjqjKZFA1oPxoyw8q
         d5cc4DhxBW5gICUa4saKB4XneZPN5+FOpq44FePdHftAvCwEVrWpRn5CLGeLKPlG8sSj
         kJ7lmrUimAgnduTn+3eXo0nLX2Wx/I2Hs9ocTXzKmD64SKws0dk8Dz8oY7KcY6f3jAkH
         EFZ1GSFWFxWIbEE0618PkTTwtQ04zrGa1WxAKqCNRUIIasto4yA/63PTc+/ihb8XKdvB
         DhnXj/Z7Wgeog22FSLPoU75tjnC1PD6RSgCfmPfsx1So0hCF6282C+d5rKqfM/cziLXm
         BmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633222; x=1794238022;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBo6eoZILf9FXsA6KADnqw6aBIyY/61Jx7TtUC5p3AU=;
        b=HLFroZZI/zgMLRvR1jqNggDyoU7TVwnvsXboe0eaAx9oh7aoKs+7ETXJ7VcDB8DFQD
         VLBbK8X/hkJeFyEUf7u5wKpvIT2NqEGK92cVhVSz1kTYF+eKVv8sB+1fqZyrlc27UwZM
         RM6FElJQtOX6eGNb4dy0l64xsc9dmBtf+NtmhrsKNuG3J0+VBO7ECcCJIE8IF/il+rmg
         /QKnrWSu71RVS6lRtsbk4VlPvFCVIwEA0uvTahYdu4Sp+Wl8heGLmw3e4xLPTEaIEKuX
         qSY7NC+nnB0mZxFYsLF+74fxw+0KfR8fViBuKgJJ71jNqWruVJdeMZRKYF8dJzf5dImt
         CO+Q==
X-Gm-Message-State: APuU4Z8hekcCRnhBZnnuKzGyN/RyNjrwfvmlyMz+K/MaCcYzeaeNBojo
	/kPOaex7BKm8caqGBDHfYQriYFvIE69eeLW4GZ4TAgnSWnwq7Cm9N7//GQgpwUusJKDaxS30EOr
	2qRpVK7uaI81mnL/mKzSHPRrgE8gKVcxGgpEioGkrAK9zZcrSAUUBuUjqs28bRx+5d2e1oszHWV
	c7vOKq5bd06xwgS3TzsIKCy3ur0w0Fp22AwEG8qs2FtlY64UzS
X-Received: from pffl19-n2.prod.google.com ([2002:a05:6a00:c353:20b0:88c:e369:e5a4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d1b:b0:89e:43ee:6538
 with SMTP id d2e1a72fcca58-8a9bf23cf6dmr8004990b3a.36.1793633221862; Mon, 02
 Nov 2026 07:27:01 -0800 (PST)
Date: Mon, 2 Nov 2026 07:27:01 -0800
In-Reply-To: <sashiko-outbox-191575@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261030212721.2606393-1-seanjc@google.com> <20261030212721.2606393-6-seanjc@google.com>
 <sashiko-outbox-191575@kernel.org>
Message-ID: <auirxeLJR8hirgtV@google.com>
Subject: Re: [PATCH v3 5/7] KVM: x86: Recompute EFER.LMA instead of inheriting
 the current value on EFER writes
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kvm: x86: guest-triggerable WARN_ON_ONCE in set_efer() via SVM state sync

See https://lore.kernel.org/all/at-TP7Il6rWcd5Xh@google.com.
