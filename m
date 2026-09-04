Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E6D4EE87B
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535838; cv=none; b=Q/K72DkpazSEG5Mq45dX58mqyD3kX1dX9naCL9AOGeXLnczJhLQYDFsh19tuoKoTVspKOjeVKzMinqVUPdzz30c3XIqw6wtiDW4AIQEh1cJ4arrVMdj+65OpyBsC2gCb1Irfcgfivrfw5SOkD4bC6wzLyeSpL9vIJo2rf4Z0NPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535838; c=relaxed/simple;
	bh=enrMTCqbcwGpANG0acoNtI2xdi6tb37KrmYRVbYAknM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuRlWXLeOqO8scBUn4neC9MJwxcA3TRJQC00Z1a+rodx/i6MO3wNWIQQ6KaqE9uSViinO0g1tAItropOQ/qCpSw+WgYCNXIjKCWTFZbA+EXQohkA64O6Fkq4Kk7Hv6HopZBIMxJIkJPAt9F4bFtOr4YBLs0poRd/QapCKRwP/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ns4mg9Da; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ns4mg9Da"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so13216935e9.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788535835; x=1789140635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EckKFK1Ub9PvsMWglTbO4VcDJbOw095C6Au9K6oB4qQ=;
        b=Ns4mg9DaY1n/3R0ZxboJOf8/aYdKGbOF2IYN4ZrUUJYjRul7Y0AvWbuxC/x1LdXtvu
         LO/qc2fyuPYXzT4ecsf5CNvu8vTazb3fz138L+246ia1nNCizJ7fInOKBI6/oyLcSExX
         OqfN1gB1CrWjnWNZeLY7OMFNmXLG+6O7on2+wIkifuWAIcigsGLXVWLa0gW5fhetT/4C
         4DQODrWzdh/jKs1tf/iV5FFVCVsUhOGcr75uA+TDAy3yFkKCfMfMaRdG2M8FrD8s1g69
         oFhR1NXUGxA47cTMPjZoMOV8GcLTTNG623SMWbgXMlh6XLGNKRgQFTQ/4POR++68WIBU
         dPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535835; x=1789140635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EckKFK1Ub9PvsMWglTbO4VcDJbOw095C6Au9K6oB4qQ=;
        b=Vmuq+E9+uAXjxY68gGYq7DE0IOnyq9zUQshkCSEM7rfBvBkXVy1XBABMMMeAAYKftq
         c480I6tzOaXCzwngjnzaeoFmQcrsIU8ZMcFkebW0qzKqSYKjZqj6GckD4dmh4ndLvPvJ
         OmGhSWX5Aj0Ycbhi8fl+m+BSIfmNOHl4ZmTycL63c066Yj/8ZoJoGVsT6BmwLh/GIGp0
         hujTdz4con6znbNyq+Ab2HcJ9+sjVhBzXw6rCDHo3AVtsSXRdYMM7z9N/pJl1VrYAeaE
         INDZ5g3FZW09yIGoXD0VlYaZz74bC5Cyb48rq6zT6cF4PnB/nW7ziIGdGcqj0sbRJGkf
         dx2w==
X-Forwarded-Encrypted: i=1; AKwUvBwYYQHLH2MKAjw9e+/Hov+4fJGYnfwdALFd/BdOKnKpUkPI2Jf0YlixTADebGAj1idZEzwMVOtw+yHJKbes7aM=@lists.linux.dev
X-Gm-Message-State: AFuF++nKbMTFkVtz9Bvia1CBgryNyOqdD54hdos5OdSUe2MbUyA/Ruun
	EETNL2XNg70ATbBjjYa22qeobZda/LC+kRMvJbnQ2eG7ZY8PJPSt/r2i
X-Gm-Gg: AYBFou3G731Qh9W8+S7ZGA7t9dEkqS9adQgEhjlB+2fj+AoPsfdal+HTejwdKwjHSJh
	ph2WAvAyqb0zAQlbha1oJ2l/FoJWVMGeR4kMUl2dfLcUzrtUhBnz3gpO5vrdDq+GnZh9Z4EOz6o
	sars9khCKtisnRj+/tB5pTotVBsmEJmmcryhAqgZnA1qy9IzMfiwzVyAW7xggDCwE1NkQRK04yy
	hpSvlTRfa7d20mEFk6Uh5x7qbAEtIbzQIkqOLSzrmlQdP4aAgrUDmGWtC/sClctlE+AvRftcxk9
	5cJjHYAox65mKO5HvY0m+vlt5bvqi1/lreYBgll58QvmxME9VCIw2zVuvuLjUMr4jWvkPyz1HoV
	BXx/opisuiHvkerCyGrCTDP7tyQfJnCnAZxrQvPgyh4dgU5b/9nEtZ2pR3Vg3jPJFm+BX3xKVjC
	VXBZBOiFgAuYIxOonR/ByZZDpa1ExPL6oOjYEX76zPLuqXqHEUkKqAdI86Qa0190qdv6XziNbh+
	Q==
X-Received: by 2002:a05:600c:a4b:b0:499:4e47:eaf2 with SMTP id 5b1f17b1804b1-49cf824020amr63299485e9.6.1788535834752;
        Fri, 04 Sep 2026 08:30:34 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b5f:900:ef25:2f4:1792:4e6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60bae6sm194191315e9.9.2026.09.04.08.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:30:34 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: sashiko-bot@kernel.org
Cc: bpf@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	tasos.papagiannnis@gmail.com
Subject: Re: [PATCH bpf-next v4 2/7] exec: Clear bprm->mm before dropping its reference
Date: Fri,  4 Sep 2026 18:30:06 +0300
Message-ID: <20260904153006.42450-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904152018.0B7B11F00A3D@smtp.kernel.org>
References: <20260904152018.0B7B11F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> [Severity: High]
> This isn't a bug introduced by this patch, but since this commit prevents a
> use-after-free for bprm->mm, should we also clear bprm->file?

> Looking slightly further down in free_bprm(), the reference to bprm->file is
> dropped, but the pointer is not set to NULL:

> 	do_close_execat(bprm->file);
> 	/* An unconsumed PT_INTERP substitute from a binfmt_misc loader entry. */
> 	bprm_drop_loader(bprm);

> Immediately after, the global function bprm_drop_loader() is called. If a
> BPF fentry program is attached to bprm_drop_loader(), it will receive the
> bprm argument.

> Because the BPF verifier explicitly annotates bprm->file as a trusted
> pointer in kernel/bpf/verifier.c:

> BTF_TYPE_SAFE_TRUSTED(struct linux_binprm) {
> 	struct file *file;
> };

> Could this allow the BPF program to read the dangling bprm->file pointer as
> a PTR_TRUSTED pointer and pass it to kfuncs requiring trusted arguments,
> resulting in a use-after-free?

This is already fixed by:
https://lore.kernel.org/bpf/20260903-normung-opfer-matten-d29bbd55cf46@brauner/.
